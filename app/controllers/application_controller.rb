class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    if %w{en es}.include?(lang = params[:lang])
      session[:lang] = lang
    else
      session[:lang] ||= 'en'
    end

    session[:page] = nil unless pages.include?(session[:page])

    if pages.include?(page = params[:page])
      session[:page] = page
    elsif page
      page = session[:page] = nil
    else
      page = session[:page]
    end

    if page
      render "#{page}_#{session[:lang]}"
    else
      render session[:lang]
    end
  end

  def pages
    []
  end
end
