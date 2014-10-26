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

bash "gitlab-ctl reconfigure" do
  code <<-EOS
    gitlab-ctl reconfigure
  EOS
end
