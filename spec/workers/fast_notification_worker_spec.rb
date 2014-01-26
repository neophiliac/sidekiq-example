require 'spec_helper'
require 'sidekiq/testing'

note = FastNotificationWorker.new
note.perform(Message.create.id)

