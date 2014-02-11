class ApiCallWorker
  include Sidekiq::Worker
  def perform(sitestat_id)
    if (s = SiteStat.find(sitestat_id)) && s.page.nil?
      fetch_page(s)
    end
  end

  def fetch_page(sitestat)
    logger.info "fetching #{sitestat.url}"
    begin
      if !sitestat.fetched?
        page = open(sitestat.url).read
        page_bytes = page.length
        sitestat.update_attributes page: page, page_bytes: page_bytes
        sitestat.touch  # set update timestamp
      else
        true
      end
    rescue Exception => e # normally caused by a bad URL
      logger.debug e.message  # this logger is provided by Sidekiq, includes job info
      return false
    end
  end

end
