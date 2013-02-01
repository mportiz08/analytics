class TopURLReport
  attr_reader :data
  
  def initialize
    @data = {}
  end
  
  def build
    today = Time.now
    (0...5).each do |i|
      date = (today - i.days).strftime("%F")
      @data[date] = urls_sorted_by_visits(date)
    end
    
    self
  end
  
  private
  
  def urls_sorted_by_visits(date)
    urls = []
    
    date_matches = { Sequel::SQL::Function.new(:date, :created_at) => date }
    
    collection = PageView.where(date_matches)
                         .group_and_count(:url)
                         .order(:count).reverse
    collection.each do |view|
      urls << { :url => view.url, :visits => view.values[:count] }
    end
    
    urls
  end
end