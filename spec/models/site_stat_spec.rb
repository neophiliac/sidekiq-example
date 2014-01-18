require 'spec_helper'

describe SiteStat do
  describe "[happy path]" do
    before(:each) do
      stub_request(:get, SITESTATSTEST['url']).to_return(body: SITESTATSTEST['page'], :status => 200)

      @site_stat = SiteStat.create({:url => SITESTATSTEST['url']})
    end

    it "requests an address for a name" do
      @site_stat.page_bytes.should eq(SITESTATSTEST['page'].length)
      @site_stat.page.should eq(SITESTATSTEST['page'])
    end

    it "returns a display-sized portion of the page" do
      @site_stat.page_snippet.length <= 100
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

