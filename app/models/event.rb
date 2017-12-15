class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attends, dependent: :destroy
  has_many :attendees, through: :attends, source: :user ##may remove source

  validate :date_future_validate
  
  def date_future_validate
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end   

end
