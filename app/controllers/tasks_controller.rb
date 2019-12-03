class TasksController < ApplicationController
  before_action :login_required
  before_action :set_user

  def index
    @tasks = Task.where(user: @user, created_at: Time.zone.today.all_day)
  end

  def create
    @task = Task.create(task_params.merge(user: current_user))
    redirect_to tasks_path
  end

  def update
    task = Task.find(params[:id])
    redirect_to login_path if task.user != current_user
    task.update(task_params)
  end

  private

  def login_required
    redirect_to login_path unless logged_in?
  end

  def set_user
    @user = User.find_by(id: params[:user_id]) || current_user
  end

  def task_params
    params.require(:task).permit(:name, :finished)
  end
end