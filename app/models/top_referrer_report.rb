class TopReferrerReport
  attr_reader :data
  
  LIMIT = 5
  
  def initialize
    @data = {}
  end
  
  def build
    today = Time.now
    (0...5).each do |i|
      date = (today - i.days).strftime("%F")
      @data[date] = top_referrers(date)
    end
    
    self
  end
  
  private
  
  def top_referrers(date)
    urls = []
    
    date_matches = { Sequel::SQL::Function.new(:date, :created_at) => date }
    
    collection = PageView.where(date_matches)
                         .group_and_count(:url)
                         .order(:count).reverse
    collection.each do |view|
      url = { :url => view.url, :visits => view.values[:count] }
      
      referrers = PageView.where(date_matches.merge({ :url => view.url }))
                          .group_and_count(:referrer)
                          .order(:count).limit(LIMIT).reverse
                          .reject { |r| r.referrer.nil? }
      url["referrers"] = []
      referrers.each do |r|
        url["referrers"] << { :url => r.referrer, :visits => r.values[:count] }
      end
      
      urls << url
    end
    
    urls
  end
end
