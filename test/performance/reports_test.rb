require 'test_helper'
require 'rails/performance_test_help'

load "#{Rails.root}/db/seeds.rb"

class ReportsTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def test_top_urls
    get '/top_urls'
  end
  
  def test_top_referrers
    get '/top_referrers'
  end
end
