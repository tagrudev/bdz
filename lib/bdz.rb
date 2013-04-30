require "nokogiri"
require "json"
require "bdz/version"

module Bdz
  BASE_URL = "http://bdz.bg/m/"
  ROOT_URL = "http://bdz.bg/m/commit.php"
end

require "bdz/client"
require "bdz/parser"
require "bdz/train"
