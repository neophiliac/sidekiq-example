require 'spec_helper'

describe SiteStat do
  describe "[happy path]" do
    it "requests an address for a name" do
      stub_request(:get, SITESTATSTEST['url']).to_return(body: SITESTATSTEST['page'], :status => 200)

      s = SiteStat.create({:url => SITESTATSTEST['url']})
      s.page_bytes.should eq(SITESTATSTEST['page'].length)
      s.page.should eq(SITESTATSTEST['page'])
    end
  end

  describe "[sad path]" do
    it "fails if the url is malformed" do
      #pending "write some sad path tests"
      s = SiteStat.create({:url => "no-scheme.com"})
      s.page.should be_nil
    end
  end
end

