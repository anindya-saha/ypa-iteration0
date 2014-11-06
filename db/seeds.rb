# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Event.create!(name:  "Dummy Event", desc: "Dummy Description", from_date: Date.today + 10, to_date: Date.today + 11, venue: "Some Venue", min_before_start: 10, max_before_end: 30, deleted: false)
#Category.create!(name:  "Dummy Category", desc: "Dummy Description", deleted: false)

require 'date'
require 'time'

5.times do |n|
  name  = "Category-#{n+1}"
  
  chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789'
  desc = ''
  3.times do |i|
	desc << ' '
	rand(10...20).times { |j| desc << chars[rand(chars.length)] }
  end
  
  Category.create!(name: name, desc: desc, deleted: false)
end


99.times do |n|
  name  = "Event-#{n+1}"
  
  chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789'
  desc = ''
  3.times do |i|
	desc << ' '
	rand(10...20).times { |j| desc << chars[rand(chars.length)] }
  end
  
  from_date = Date.today + Random.new.rand(1...10)
  to_date = from_date + Random.new.rand(1...5)
  
  from_time = Time.at(100)
  from_time = Time.mktime(from_date.year, from_date.month, from_date.day, from_time.hour, from_time.min)
  
  to_time = Time.at(3500)
  to_time = Time.mktime(to_date.year, to_date.month, to_date.day, to_time.hour, to_time.min)
	
  venue = ''
  rand(5...10).times { |j| venue << chars[rand(chars.length)] }
  
  category_id = Random.new.rand(1...5)
  
  min_before_start = Random.new.rand(10...30)
  max_before_end = Random.new.rand(30...60)

  Event.create!(name:  name, desc: desc, from_date: from_date, to_date: to_date, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, venue: venue, min_before_start: min_before_start, max_before_end: max_before_end, category_id: category_id, deleted: false)
end