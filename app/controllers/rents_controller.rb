class RentsController < ApplicationController
#TODO: Rent form above calendar mainscreen
  rescue_from "ActiveRecord::RecordNotUnique", with: :not_unique

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save

      redirect_to root_path,
                    notice: "Велосипед записан за вами на " + @rent.date.strftime("%y.%m.%d")
    else
      redirect_to new_rent_path, notice: "Не все поля заполнены."		
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

  def not_unique
    redirect_to new_rent_path, notice: "Похоже, кто-то уже записался на это время."

  end
end
