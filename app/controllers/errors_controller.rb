class ErrorsController < ApplicationController

  def not_found
    img ||= Dir.entries("public/assets/404").select{ |f| f != '.' && f != '..'}
    @image = img[rand(img.size+1)]
  end
end
