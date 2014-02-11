require 'spec_helper'
require 'sidekiq/testing'

describe SiteStat do
  describe "[happy path]" do
    Sidekiq::Testing.fake!  # queue jobs but don't call #perform

    it "queues a job to call the API on create" do
      s = SiteStat.create({url: SITESTATSTEST['url']})
      expect {
        s.run_callbacks(:commit)
      }.to change { ApiCallWorker.jobs.count }.by(1)
    end

    it "#page_snippet returns a display-sized portion of the page" do
      site_stat = SiteStat.create({:url => SITESTATSTEST['url']})
      site_stat.page = SITESTATSTEST['page']
      site_stat.page_bytes = site_stat.page.length # <- code smell!
      site_stat.page_snippet.length <= 100
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

