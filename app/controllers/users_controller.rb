class UsersController < ApplicationController
  before_action :authenticate_user!

  def all_projects
    render :json => current_user.projects
  end
end
