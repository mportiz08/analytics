def random_time_from_past_num_days(num_days)
  now  = Time.now
  past = now - num_days.days
  Time.at ((now.to_f - past.to_f) * rand) + past.to_f
end

NUM_RECORDS = 1000000

(NUM_RECORDS / 8).times do
  PageView.create({
    :url        => 'http://apple.com',
    :referrer   => 'http://store.apple.com/us',
    :created_at => random_time_from_past_num_days(5)
  })
end

(NUM_RECORDS / 8).times do
  PageView.create({
    :url        => 'http://apple.com',
    :created_at => random_time_from_past_num_days(5)
  })
end

(NUM_RECORDS / 8).times do
  PageView.create({
    :url        => 'https://apple.com',
    :referrer   => 'http://apple.com',
    :created_at => random_time_from_past_num_days(365)
  })
end

(NUM_RECORDS / 8).times do
  PageView.create({
    :url        => 'https://www.apple.com',
    :created_at => random_time_from_past_num_days(365)
  })
end

(NUM_RECORDS / 8).times do
  PageView.create({
    :url        => 'http://developer.apple.com',
    :referrer   => 'https://apple.com',
    :created_at => random_time_from_past_num_days(365)
  })
end

(NUM_RECORDS / 8).times do
  PageView.create({
    :url        => 'http://en.wikipedia.org',
    :referrer   => 'http://opensource.org',
    :created_at => random_time_from_past_num_days(365)
  })
end

(NUM_RECORDS / 8).times do
  PageView.create({
    :url        => 'http://opensource.org',
    :referrer   => 'http://en.wikipedia.org',
    :created_at => random_time_from_past_num_days(365)
  })
end

(NUM_RECORDS / 8).times do
  PageView.create({
    :url        => 'http://developer.apple.com',
    :referrer   => 'http://opensource.org',
    :created_at => random_time_from_past_num_days(365)
  })
end
