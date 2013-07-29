class RentsController < ApplicationController

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save

      redirect_to root_path,
                    notice: "Велосипед записан за вами на " + @rent.date.strftime("%y.%m.%d")
    else
      #TODO: Exception handling?
      render :new, notice: "Что-то пошло не так. Запись не создана."
    end
  end

  def destroy
    rent_to_del = Rent.find(params[:id])
    rent_to_del.destroy
    flash[:success] = 'Запись удалена'
    redirect_to root_path
  end

  private
  def rent_params
    params.require(:rent).permit(:renter_name, :date, :bicycle_id)
  end

end