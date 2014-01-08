require 'open-uri'
require 'awesome_print'

class SiteStat < ActiveRecord::Base
  after_save :fetch_page, on: :create
  validates :url, presence: true

  def fetch_page
    begin
      if self.page.nil?
        page = open(self.url).read
        page_bytes = page.length
        self.update_attributes page: page, page_bytes: page_bytes
      else
        true
      end
    rescue Exception => e # normally a bad URL
      self.errors[:base] << e.message
      return false
    end
  end
end
