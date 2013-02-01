require 'test_helper'

class PageViewTest < ActiveSupport::TestCase
  test 'the digest field is set correctly' do
    page_view = PageView.create({
      :url        => 'http://apple.com',
      :referrer   => 'http://store.apple.com/us',
      :created_at => Time.parse('2012-01-01')
    })
    
    assert_equal '08094334731bdb53e9591257a4b50090', page_view.digest
  end
end
