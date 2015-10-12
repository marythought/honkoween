#!/usr/bin/env ruby

require "dotenv"
require "twitter"
Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['TOKEN_SECRET']
end

tweet_time = "07:06PM"
halloween = Time.local(2015,10,31,00,00,00)

loop do
  t = Time.now
  day = t.day
  time = t.strftime("%I:%M%p") #"07:44PM"
  days_remaining = halloween.day - t.day
  if day == halloween.day && t.strftime == "08:00AM"
    client.update("HONK if u like HONKIN https://youtu.be/TrsvTqcMrKo")
    sleep 36000
  elsif day == halloween.day && time == tweet_time
    client.update("HAPPY HONKOWEEN! https://youtu.be/TrsvTqcMrKo")
    sleep 36000
  elsif day == 1 && t.strftime == "08:00AM"
    client.update("See you next scare... https://youtu.be/TrsvTqcMrKo")
    break
  elsif time == tweet_time
    client.update("Only #{days_remaining} days until Honkoween! https://youtu.be/TrsvTqcMrKo")
    sleep 36000
  end
end

# User stories:
# I want my bot to tweet once a day with one of several prerecorded messaged
# to the effect of "Happy Honkoween! https://youtu.be/TrsvTqcMrKo"

