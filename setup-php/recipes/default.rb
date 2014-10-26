#
# Cookbook Name:: setup-php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
template "php.ini" do
	path "/etc/php.ini"
	owner "root"
	group "root"
	mode 0644
end
