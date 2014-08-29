# encoding: UTF-8
class UsersController < ApplicationController
  def index
    @users = User.all.sort_by{|u| u[:username]}
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Пользователь зарегистрирован!"
    else
      flash[:error] = @user.errors.full_messages
    end
    redirect_to root_url
  end
end
