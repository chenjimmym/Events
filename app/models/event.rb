class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attends, dependent: :destroy
  has_many :attendees, through: :attends, source: :user ##may remove source
end
