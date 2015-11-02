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

tweet_time = "07:00PM"
halloween = Time.local(2016,10,31,00,00,00)

loop do
  t = Time.now
  time = t.strftime("%I:%M%p") #"07:44PM"
  days_remaining = halloween.day - t.day
  if t.day == halloween.day && time == "08:00AM"
    client.update("HONK if u like HONKIN https://youtu.be/TrsvTqcMrKo")
    sleep 36000
  elsif t.day == halloween.day && time == tweet_time
    client.update("HAPPY HONKOWEEN! https://youtu.be/TrsvTqcMrKo")
    sleep 36000
  elsif t.month == 11 && t.day == 1 && time == "08:00AM"
    client.update("See you next scare... https://youtu.be/TrsvTqcMrKo")
    break
  elsif t.month == 10 && time == tweet_time
    client.update("Only #{days_remaining} days until Honkoween! https://youtu.be/TrsvTqcMrKo")
    sleep 36000
  end
end

# User stories:
# I want my bot to tweet once a day with one of several prerecorded messaged
# to the effect of "Happy Honkoween! https://youtu.be/TrsvTqcMrKo"

