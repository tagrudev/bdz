# -*- coding: utf-8 -*-
require 'faraday'
module Bdz
  class Client
    attr_reader :params
    attr_reader :faraday_client

    def initialize
      @params = {}
      @faraday_client = Faraday.new(:url => Bdz::ROOT_URL) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    # client.search({ot: "Plovdiv", do: "Sofia"})
    def search(params = {})
      content = get(params)
      parser = Bdz::Parser::Schedule.new content
      parser.parse
    end

    private
    def get(params = {})
      @faraday_client.post do |req|
        req.params = params
      end
    end
  end
end
