module Bdz
  class Client
    attr_reader :params
    def initialize
      @params = {}
    end

    private
    def build_params(params)
      @params = params.merge({ :action => 'listOptions', :dep_arr => '1', :time_from => '00:00', :time_to => '24:00', :all_cats => 'checked', 
        :cardId => '30', :sort_by => '0'})
    end
  end
end
