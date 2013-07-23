class BicyclesController < ApplicationController

  def index
    @bicycles = Bicycle.order('name ASC').all
  end

  def show
    @bicycle = Bicycle.find(params[:id])
    @rents = @bicycle.rents.order('date DESC').all
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    if @bicycle.save
      redirect_to @bicycle, notice: "Велосипед добавлен"
    else
      render :new
    end
  end

  private
  def bicycle_params
    params.require(:bicycle).permit(:name)
  end
end