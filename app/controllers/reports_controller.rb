class ReportsController < ApplicationController
  def top_urls
    render :json => TopURLReport.new.build.data
  end

  def top_referrers
  end
end
