class Reminder < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :time, presence: true
  validates :date, presence: true
  belongs_to :event
end
