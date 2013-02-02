class ReportsController < ApplicationController
  caches_action :top_urls, :top_referrers, { :expires_in => 1.day }
  
  def top_urls
    render :json => TopURLReport.new.build.data
  end

  def top_referrers
    render :json => TopReferrerReport.new.build.data
  end
end
