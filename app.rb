#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require
Dotenv.load
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'content_alert'

def main
  if ENV['STOP_CONTENT_ALERT']
    puts 'env STOP_CONTENT_ALERT exists'
    return
  end
  ContentAlert::Alert.run
end

main
