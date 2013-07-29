#
# Cookbook Name:: apt-server-cookbook
# Recipe:: default
#
# Copyright (C) 2013 Valerii Bereza
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"

%w{reprepro s3cmd build-essential}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "Create local repository path" do
  command "mkdir -p #{node[:apt_server][:local_repo_path]}"
  cwd "/tmp"
  action :run
end

user = node[:apt_server][:user]
home = user.to_s == :root.to_s ? "/root" : "/home/#{user}"

template "s3cfg" do
  path "#{home}/.s3cfg"
  source "s3cfg.erb"
  user "#{user}"
  group "#{user}"
  mode 0600
end
