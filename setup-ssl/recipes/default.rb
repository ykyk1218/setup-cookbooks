#
# Cookbook Name:: setup-ssl
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "server.crt" do
	path "/etc/httpd/ssl/server.crt"
	owner "root"
	group "root"
	mode 0644
end

template "server.key" do
	path "/etc/httpd/ssl/server.key"
	owner "root"
	group "root"
	mode 0644
end