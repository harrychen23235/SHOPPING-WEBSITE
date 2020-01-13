class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  include SessionsHelper

  def clear
   
  end

  def current_order
    if !session[:order_id].nil?
	begin
      Order.find(session[:order_id])
	  rescue 
	  @order=Order.new
  session[:order_id]=@order.id
  return @order
	  end
    else
      Order.new
    end
  end


  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    current_user && current_user == user
  end
end
