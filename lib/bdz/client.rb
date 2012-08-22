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

    # client.search({:from_station => "Пловдив", :to_station => "София", :date => "20/08/2012"})
    def search(params = {})
      content = get(params)
      parser = Bdz::Parser::Schedule.new content
      parser.parse
    end

    private
    def get(params = {})
      @faraday_client.post do |req| 
        req.params = build_params(params)
      end
    end

    def build_params(params = {})
      @params = params.merge({ :action => 'listOptions', :dep_arr => '1', :time_from => '00:00', :time_to => '24:00', :all_cats => 'checked', 
        :cardId => '30', :sort_by => '0'})
    end
  end
end
