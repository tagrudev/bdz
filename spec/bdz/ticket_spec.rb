#encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Bdz::Ticket do
  let(:ticket) { Bdz::Ticket.new({:id => "1", :type => "БВ", :price => "2.6"}) }

  describe 'Train object methods and instance_variables' do
    it 'should have a method serialize to json that returns intance vars to json' do
      ticket.as_json.should ==  "{\"id\":\"1\",\"type\":\"БВ\",\"price\":\"2.6\"}"
    end
  end
end
