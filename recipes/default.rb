#
# Cookbook Name:: gitlab
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "download gitlab deb" do
  CODE <<-EOS
    wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.2-omnibus-1_amd64.deb
  EOS
end
