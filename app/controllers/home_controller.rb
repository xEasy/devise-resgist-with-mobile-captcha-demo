class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:send_captcha]

  def index
  end

  def send_captcha
    if Captcha.send_to(params[:mobile])
      render json: { message: 'success' }
    else
      render json: { message: 'failure' }, status: :failure
    end
  end
end
