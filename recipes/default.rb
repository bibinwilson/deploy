#
# Cookbook Name:: deploy
# Recipe:: default
# Author: Bibin Wilson
# Copyright (c) 2015 The Authors, All Rights Reserved.

bash "clean up old code " do
  cwd node[:app][:folder]

  code <<-EOH
  rm -rf *
  EOH
  only_if { File.exists?(node[:app][:folder])}

end

bash "get latest code" do
	cwd node[:app][:folder]
	code <<-EOH
  		aws s3 sync s3://todo-deploy .
  	EOH
  only_if { File.exists?(node[:app][:folder])}
end

