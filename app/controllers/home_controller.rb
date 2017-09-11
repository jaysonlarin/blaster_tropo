class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def index

  end

  def upload
  end

  def sms
    response = Sms.send(params)
    redirect_to root_path
  end

  def blast
    response = Call.proceed(params)
    redirect_to root_path
  end

  def calling
    render json: Call.calling(params)
  end
end
