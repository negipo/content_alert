#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'content_alert'

def main
  return if File.exists?("#{ENV['HOME']}/.stop_content_alert")
  ContentAlert::Alert.run
end

main