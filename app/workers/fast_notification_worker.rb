class FastNotificationWorker
  include Sidekiq::Worker
  def perform(message_id)
    ActiveRecord::Base.connection_pool.with_connection do
      if (m = Message.find(message_id))
        Notifications.too_fast(m.email)
      end
    end
  end
end
