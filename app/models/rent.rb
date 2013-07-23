class Rent < ActiveRecord::Base
  belongs_to :bicycle

  validates :bicycle_id, presence: true
  validates :date,       presence: true
  validates :renter_name,       presence: true

end
