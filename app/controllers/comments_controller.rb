class CommentsController < ApplicationController

  def create
    #確認評論是屬於哪一個@restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    #(關聯資料）建立屬於@restaurant的評論，評論內容來自表單傳入的資料
    @comment = @restaurant.comments.build(comment_params)
    #另一個關聯外鍵
    @comment.user = current_user
    #將評論存入資料庫
    @comment.save
    #回到restaurant/show
    redirect_to restaurant_path(@restaurant)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
