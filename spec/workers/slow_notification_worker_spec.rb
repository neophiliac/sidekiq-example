require 'spec_helper'
require 'sidekiq/testing'

describe SlowNotificationWorker do
  it "sends an email on #perform" do
    expect(Notifications).to receive(:too_slow)

    SlowNotificationWorker.new.perform(Message.create.id)
  end
end
