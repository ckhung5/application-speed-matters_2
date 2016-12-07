class UsersController < ApplicationController
  def index
    # @users = User.by_total_points.limit(50)

    if params[:number].nil?
    @users = User.by_total_points.page(1)
    @previous_page = 0
    @next_5_page =  5
    @current_page = 1
    @maximum_page = ((User.all.count)/50.0).ceil
    else
    @users = User.by_total_points.page(params[:number].to_i)
    @previous_page =  params[:number].to_i - 1
    @next_5_page = params[:number].to_i + 5
    @current_page = params[:number].to_i

    @maximum_page = ((User.all.count)/50.0).ceil
    end
  end
end
