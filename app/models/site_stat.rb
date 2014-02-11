require 'open-uri'
require 'awesome_print'

class SiteStat < ActiveRecord::Base
  after_commit :schedule_fetch, on: :create
  validates :url, presence: true

  def fetched?
    !page.nil?
  end

  def page_snippet
    if fetched?
      "Requesting page..."
    else
      page[0..100]
    end
  end

  def schedule_fetch
    ap self
    ApiCallWorker.perform_async(self.id)
  end
end
