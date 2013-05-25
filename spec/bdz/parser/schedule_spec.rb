#encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Bdz::Parser::Schedule do
  let(:client) { Bdz::Client.new}
  it 'doesnt get enough params' do
    stub_request(:post, "http://bdz.bg/m/commit.php").
    with(:body => {"ot"=>"PLOVDIV", "submit"=>"ТЪРСЕНЕ"},
         :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => "", :headers => {})
    m = client.search({ot: "PLOVDIV"})
    m.should be_empty
  end

end
