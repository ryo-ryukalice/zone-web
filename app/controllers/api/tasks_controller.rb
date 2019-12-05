class Api::TasksController < ApplicationController
  before_action :authenticate_by_token

  def index
    @tasks = @user.tasks.where(created_at: Time.zone.today.all_day)
    render json: @tasks.map { |task| { name: task.name, finished: task.finished } } 
  end

  private

  def authenticate_by_token
    @user = User.find_by(api_token: params[:api_token])
    render status: :unauthorized, json: 'Invalid API token' if @user.blank?
  end
end