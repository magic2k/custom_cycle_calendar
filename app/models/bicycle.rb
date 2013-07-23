class Bicycle < ActiveRecord::Base
  has_many :rents, dependent: :destroy

  validates :name, presence: true, uniqueness: true


end
