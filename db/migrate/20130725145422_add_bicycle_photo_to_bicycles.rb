class AddBicyclePhotoToBicycles < ActiveRecord::Migration
  def change
    add_attachment :bicycles, :bicycle_photo
  end
end
