class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  
  def index 
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant was successfully created!"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "Restaurant was filed to create!!"
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant)
      flash[:notice] = "Restaurant was successfully updated!"
    else

      flash[:alert] = "Restaurant was failed to update!!"
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "Restaurant was deleted!!"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
