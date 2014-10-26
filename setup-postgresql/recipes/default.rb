#
# Cookbook Name:: setup-postgresql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
bash 'create_database' do
        user "postgres"
        code <<-EOH
                initdb -D /var/lig/pgsql9/data --encoding=EUC_JP --locale=C
                create role pguser
                create user pguser
                createdb -E EUC-JP example_dev --template=template0 --locale=C
        EOH
        not_if "psql -U postgres -c \"select * from pg_database\" | grep -q example_dev", :user=>"postgres"
end


bash 'import_data' do
        user "postgres"
        code "psql fchikaku_dev < /vagrant/example_dev.dump"
        only_if "psql -U postgres -c \"select * from pg_database\" | grep -q example_dev", :user=>"postgres"
end
