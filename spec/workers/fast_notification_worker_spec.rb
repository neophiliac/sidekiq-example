require 'spec_helper'
require 'sidekiq/testing'

describe FastNotificationWorker do
  it "sends an email on #perform" do
    expect(Notifications).to receive(:too_fast)

    FastNotificationWorker.new.perform(Message.create.id)
  end
end
