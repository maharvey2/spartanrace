require 'pry'
require 'httparty'

require_relative "spartanrace/version"
require_relative "spartanrace/cli"
require_relative "spartanrace/api"
require_relative "spartanrace/race"

module SpartanRace
  class Error < StandardError; end
  # Your code goes here...
end
