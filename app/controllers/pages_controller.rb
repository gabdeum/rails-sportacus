class PagesController < ApplicationController
  def home

  end

  def account
    if !user_signed_in?
      redirect_to :user_session
    end
  end
end
