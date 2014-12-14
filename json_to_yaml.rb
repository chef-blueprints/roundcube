#!/usr/bin/ruby

require 'json'
require 'yaml'

json = IO.read("rightscale.json")
data = JSON.parse(json)
yml = YAML::dump(data)

puts yml
