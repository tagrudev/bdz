#encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Bdz::Client do
  let(:client) { Bdz::Client.new }

  describe '#build_params' do
    it 'should merge defaults with params' do
      params = client.send :build_params, {:from => 'Пловдив'}
      params.should == {:from=>'Пловдив', :action=>"listOptions", :dep_arr=>"1", :time_from=>"00:00", :time_to=>"24:00",
        :all_cats=>"checked", :cardId=>"30", :sort_by=>"0"}
    end
  end
end
