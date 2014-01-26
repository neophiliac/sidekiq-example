class FastNotificationWorker
  include Sidekiq::Worker
  def perform(message_id)
    if (m = Message.find(message_id))
      Notifications.too_fast(m.email)
    end
  end
end
