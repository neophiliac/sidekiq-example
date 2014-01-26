require 'spec_helper'
require 'sidekiq/testing'

note = SlowNotificationWorker.new
note.perform(Message.create.id)
