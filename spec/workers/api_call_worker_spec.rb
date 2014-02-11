require 'spec_helper'
require 'sidekiq/testing'

describe ApiCallWorker do
  it "does HTTP 'get' on #perform" do
    pending "use webmock or VCR here to prevent network activity"
    ApiCallWorker.new.perform(SiteStat.create({url: 'http://bit.ly'}).id)
  end
end
