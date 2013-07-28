class BicyclesController < ApplicationController

  before_filter :current_user
  before_filter :admin_user, only: [:new, :destroy]

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
      redirect_to @bicycle, notice: 'Велосипед добавлен'
    else
      render :new
    end
  end

  def edit
    @bicycle = Bicycle.find(params[:id])
  end

  def update
    #if @bicycle.update_attributes(bicycle_params)
    @bicycle = Bicycle.find(params[:id])
    if @bicycle.update_attributes(bicycle_params)
      flash[:success] = 'Данные обновлены'
      redirect_to @bicycle
    else
      render 'edit'
    end
  end

  def destroy
    bicycle_to_delete = Bicycle.find(params[:id])
    bicycle_to_delete.destroy
    flash[:success] = 'Велосипед удален'
    redirect_to bicycles_path
  end

  private
  def bicycle_params
    params.require(:bicycle).permit(:name, :bicycle_photo)
  end

  def admin_user
    redirect_to(root_path) unless current_user && current_user.admin?
  end
end