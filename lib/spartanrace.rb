require_relative "spartanrace/version"
require_relative "spartanrace/cli"
require_relative "spartanrace/scraper"
require_relative "spartanrace/race"

require 'pry'
require 'httparty'
require 'rubygems'
require 'nokogiri'


module SpartanRace
  class Error < StandardError; end
  # Your code goes here...
end
