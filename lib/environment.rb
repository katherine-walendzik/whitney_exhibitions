require_relative "./whitney_exhibitions/version"
require_relative "whitney_exhibitions/cli"
require_relative "whitney_exhibitions/exhibitions"
require_relative "whitney_exhibitions/scraper"
require_relative "whitney_exhibitions/dates"

require 'pry'
require 'nokogiri'
require 'open-uri'

module WhitneyExhibitions
  class Error < StandardError; end
  # Your code goes here...
end