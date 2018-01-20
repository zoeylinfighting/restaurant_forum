class FollowshipsController < ApplicationController
  def create
    # 需要設定前端的 link_to, 在發出請求時送進following_id
    @followship = current_user.followships.build(following_id: params[:following_id])

    if @followship.save
      flash[:notice] = "Successfully followed!"
      redirect_back(fallback_location: root_path)
    else
      # 驗證失敗時,Model將錯誤訊息放在errors裡回傳
      # 使用errors.full_messages 取出完成訊息集合（array）,串接to_sentence將Array 組合成String
      flash[:alert] = @followship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end
end
