class SlowNotificationWorker
  include Sidekiq::Worker
  def perform(message_id)
    if (m = Message.find(message_id))
      Notifications.too_slow(m.email)
    end
  end
end
