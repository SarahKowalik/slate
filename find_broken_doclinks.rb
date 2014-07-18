#!/usr/bin/env ruby
require 'net/http'

def parse uri
  res = Net::HTTP.get_response(URI(uri))
  puts uri if res.code != '200'
end

uri = []

Dir.glob('source/sections/*.md') do |file|
  File.open(file) do |f|
    f.each_line { |line| uri.push(line.split(' ').last) if line.include?('curl') and line.include?('localhost') }
  end
end

uri.each do |u|
  parse(u) if !/[0-9.,]/.match(u.split('/').last)
end
