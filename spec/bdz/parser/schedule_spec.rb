#encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'webmock/rspec'
WebMock.disable_net_connect!

describe Bdz::Parser::Schedule do
  let(:client) { Bdz::Client.new}


  it 'parse and return response of objects' do

    stub_request(:post, "http://razpisanie.bdz.bg/SearchServlet?action=listOptions&all_cats=checked&cardId=30&date=20/08/2012&dep_arr=1&from_station=%D0%9F%D0%BB%D0%BE%D0%B2%D0%B4%D0%B8%D0%B2&sort_by=0&time_from=00:00&time_to=24:00&to_station=%D0%A1%D0%BE%D1%84%D0%B8%D1%8F").
    with(:headers => {'Accept'=>'*/*', 'Content-Length'=>'0', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => File.new(File.join(File.dirname(__FILE__), '/../../mocks', "response.html")), :headers => {})
    m = client.search({:from_station => "Пловдив", :to_station => "София", :date => "20/08/2012"})
  end

  it 'doesnt get enough params' do 
    stub_request(:post, "http://razpisanie.bdz.bg/SearchServlet?action=listOptions&all_cats=checked&cardId=30&dep_arr=1&from_station=%D0%9F%D0%BB%D0%BE%D0%B2%D0%B4%D0%B8%D0%B2&sort_by=0&time_from=00:00&time_to=24:00").
    with(:headers => {'Accept'=>'*/*', 'Content-Length'=>'0', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => "", :headers => {})


    m = client.search({:from_station => "Пловдив"})
    m.should be_empty
  end
end