class Admin::CategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new
    if @category.save
      flash[:notice] = "Category was successfully creased!"
      redirct_to_admin_categories_paht
    else
      @categories = Category.all
      render :index
    end
  end

private

def category_params
  params.require(:category).permit(:name)
end

end
