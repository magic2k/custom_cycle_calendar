class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
    @rents = Rent.all
    #@rents_by_date = @rents.group_by(&:date)
    @rents_by_date = @rents.group_by { |rent| rent.date.to_date }
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
