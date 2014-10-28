class Event < ActiveRecord::Base
  attr_accessible :event_id, :name, :description, :from_date, :to_date, :from_time, :to_time, :venue, :category, :min_before_start, :max_before_end, :created_by, :updated_by, :deleted

  self.primary_key = "event_id"

  # associate event with user through user_event table
  has_many :user_events
  has_many :users, through: :user_events
end
