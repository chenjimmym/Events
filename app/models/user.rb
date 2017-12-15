class User < ActiveRecord::Base
  has_many :events
  has_many :attends, dependent: :destroy
  has_many :events_joined, through: :attends, source: :event

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, presence: true, length: {minimum: 2}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :state, presence: true, length: {is: 2}
  validates :password, presence:true, length: {minimum: 8}, on: :create

  has_secure_password
end
