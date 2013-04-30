# -*- coding: utf-8 -*-
require 'faraday'
module Bdz
  class Client
    attr_reader :params
    attr_reader :faraday_client

    def initialize
      @params = {}
      @faraday_client = Faraday.new(:url => Bdz::ROOT_URL) do |faraday|
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def search(params = {})
      content = get(params)
      parser = Bdz::Parser::Schedule.new content
      parser.parse
      binding.pry
    end

    private
    def get(params = {})
      @faraday_client.post do |req|
        req.params = build_params(params)
      end
    end

    def build_params(params = {})
      @params = params.merge({submit: 'ТЪРСЕНЕ'})
    end
  end
end
