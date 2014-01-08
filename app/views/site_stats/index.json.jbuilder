json.array!(@site_stats) do |site_stat|
  json.extract! site_stat, :id, :url, :page_bytes, :page
  json.url site_stat_url(site_stat, format: :json)
end
