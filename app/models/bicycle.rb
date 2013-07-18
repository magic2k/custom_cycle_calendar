class Bicycle < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :rents, dependent: :destroy
end
