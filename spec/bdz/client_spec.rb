#encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Bdz::Client do
  let(:client) { Bdz::Client.new }
  it 'search should return an array of Train objects' do
    stub_request(:post, "http://bdz.bg/m/commit.php").
    with(:body => {"do"=>"SOFIA", "ot"=>"PLOVDIV", "submit"=>"ТЪРСЕНЕ"},
         :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby'}).
    to_return(status: 200, body: File.new(File.join(File.dirname(__FILE__), '/../mocks', "response.html")), headers: {})
    result = client.search(ot: "PLOVDIV", do: "SOFIA")
    result.should_not be_empty
  end
end
