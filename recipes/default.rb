#
# Cookbook Name:: gitlab
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

deb_file = "gitlab_7.4.2-omnibus-1_amd64.deb"
deb_cksum = "f818cc000027813dba1eef6f686073fd7bc4a7613f36bab45f58a00da4b3e8f5"
cookbook_file "/tmp/#{deb_file}" do
  mode 00644
  checksum deb_cksum
  not_if { File.exists? "/tmp/#{deb_file}" }
end

dpkg_package "gitlab_7.4.2" do
  action :install
  source "/tmp/#{deb_file}"
end

template "/etc/gitlab/gitlab.rb" do
  owner "root"
  group "root"
  mode  00600
  source "gitlab.rb.erb"
end

#NOTE:
#  後続のbundleでcのパッケージをインストールするためにインストールを実施する
%w{g++ cmake mysql-client libmysqld-dev pkg-config}.each do |pkg|
  package pkg do
    action :install
  end
end

#TODO:
#  以下のコマンドは対話形式で実施可否を問われる。forceオプションにより対話スキップできるか確認できたらレシピに組み込む。
#  gitlab-rake gitlab:setup
bash "gitlab-ctl reconfigure" do
  code <<-EOS
    gitlab-ctl reconfigure
    gitlab-ctl start
    gitlab-ctl stop
    exec /opt/gitlab/embedded/bin/chpst -e /opt/gitlab/etc/gitlab-rails/env /opt/gitlab/embedded/bin/bundle install --deployment --without development test postgres
    gitlab-ctl reconfigure
  EOS
end
