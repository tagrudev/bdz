#encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Bdz::Train do
  let(:train) { Bdz::Train.new({:id => "1", :leaves => "00:00"}) }

  describe 'Train object methods and instance_variables' do
    it 'should have a method serialize to json that returns intance vars to json' do
      train.as_json.should ==  "{\"@id\":\"1\",\"@leaves\":\"00:00\"}"
    end
  end
end
