Analytics::Application.routes.draw do
  match '/top_urls' => 'reports#top_urls'
  match '/top_referrers' => 'reports#top_referrers'
end
