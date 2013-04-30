#encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'webmock/rspec'
WebMock.disable_net_connect!

describe Bdz::Parser::Schedule do
  let(:client) { Bdz::Client.new}


  it 'parse and return response of objects' do
    stub_request(:post, "http://bdz.bg/m/commit.php?ot=PLOVDIV&do=SOFIA").
    with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Length'=>'0', 'User-Agent'=>'Faraday v0.8.7'}).
    to_return(status: 200, body: File.new(File.join(File.dirname(__FILE__), '/../../mocks', "response.html")), headers: {})
    m = client.search({ot: "PLOVDIV", do: "SOFIA"})
  end

  it 'doesnt get enough params' do
    stub_request(:post, "http://bdz.bg/m/commit.php?ot=PLOVDIV").
    with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Length'=>'0', 'User-Agent'=>'Faraday v0.8.7'}).
    to_return(status: 200, body: "", headers: {})
    m = client.search({ot: "PLOVDIV"})
    m.should be_empty
  end
end
