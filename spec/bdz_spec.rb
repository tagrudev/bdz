require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe Bdz do
  describe '#root_url' do 
    it 'shoudl define a constant ROOT_URL that returns the url of bdz' do 
      Bdz::ROOT_URL.should == 'http://razpisanie.bdz.bg/SearchServlet'
    end
  end
end