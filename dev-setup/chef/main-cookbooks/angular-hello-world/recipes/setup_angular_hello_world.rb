#
# Cookbook:: angular-hello-world
# Recipe:: setup_angular_hello_world
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# angular-hello-world project setup

# we need this because the guest path could change in the future
# instead of ~/workspace, it's likely that we'll use /mnt/workspace
cwd_path = node['acme']['angular-hello-world']['project_guest_path']


# execute 'copy .env.example to .env file' do
#     cwd cwd_path
#     command 'cp .env.example .env'
#     not_if { ::File.exist?("#{cwd_path}/.env") }
#     user 'vagrant'
# end

# execute 'copy .env back to the host project for editing' do
#     cwd cwd_path
#     command 'cp .env /vagrant/workspace/api/.env'
#     not_if { ::File.exist?('/vagrant/workspace/api/.env') }
#     user 'vagrant'
# end

execute 'docker-compose pull' do
    cwd cwd_path
    command 'docker-compose pull --ignore-pull-failures'
end

# this is not needed after we have private registry, just login and pull, don't build
# execute 'docker-compose build dev' do
#     cwd cwd_path
#     command "docker-compose build dev"
# end

# get the dev service up by default
execute 'docker-compose up -d' do
    cwd cwd_path
    command 'docker-compose up -d'
end
