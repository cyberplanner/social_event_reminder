class AddressesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @address = Address.new
  end

  def create

    @user = User.find(params[:user_id])
    @address = Address.create(address_params)
    @user.address = @address
    if @address.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:line_one, :line_two, :postcode)
  end

end
