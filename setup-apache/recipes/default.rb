#
# Cookbook Name:: setup-apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

service "httpd" do
  action [:start, :enable]
  supports :restart => true, :reload => true
end

template "www.example.com.conf" do
	path "/etc/httpd/sites-enabled/www.example.com.conf"
	owner "root"
	group "root"
	mode 0644
	notifies :reload, 'service[httpd]'
end


directory "/var/log/httpd/www.example.com" do
  owner "root"
  group "root"
  recursive true
  mode 0777
  action :create
  not_if { File.exists? "/var/log/httpd/www.example.com" }
end
