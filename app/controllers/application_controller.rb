class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger
  def check_guest
    if current_user.email == 'test@test'
      redirect_to user_path(current_user), danger: 'ゲストユーザーは会員情報の変更・退会はできません。'
    end
  end
end
