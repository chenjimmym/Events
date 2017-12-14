class User < ActiveRecord::Base
  has_many :events
  has_many :attends, dependent: :destroy
  has_many :events_joined, through: :attends, source: :event

  has_secure_password
end
