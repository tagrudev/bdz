# -*- coding: utf-8 -*-
require 'nestful'
module Bdz
  class Client
    attr_reader :params
    attr_reader :faraday_client

    def search(params = {})
      content = Nestful.post Bdz::ROOT_URL, get(params)
      parser = Bdz::Parser::Schedule.new content
      parser.parse
    end

    private
    def get(params = {})
      build_params(params)
    end

    def build_params(params = {})
      @params = params.merge({:submit => 'ТЪРСЕНЕ'})
    end
  end
end
