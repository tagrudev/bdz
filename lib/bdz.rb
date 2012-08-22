require "nokogiri"
require "bdz/version"

module Bdz
  BASE_URL = "http://razpisanie.bdz.bg/"
  ROOT_URL = "http://razpisanie.bdz.bg/SearchServlet"
end

require "bdz/client"
require "bdz/parser"
require "bdz/train"