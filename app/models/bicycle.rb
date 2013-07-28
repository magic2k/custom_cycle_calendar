class Bicycle < ActiveRecord::Base
  has_many :rents, dependent: :destroy
  has_attached_file :bicycle_photo, styles: { medium: "300x300>", thumb: ["100x100>", :png] },
  default_url: "/images/:style/missing.png"

  validates :name, presence: true, uniqueness: true
  validates :bicycle_photo, attachment_presence: true
            #, size: { in: 0..10.megabytes }
  #validates_with AttachmentPresenceValidator, attribute: :bicycle_photo



end
