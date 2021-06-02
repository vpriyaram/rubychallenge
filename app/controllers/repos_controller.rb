class ReposController < ApplicationController
  before_action :authenticate_user!

  def weekly_popular_repos
    render :json => Repo.week_popular_repos
  end

  def ruby_popular_repos
    render :json => Repo.ruby_popular_repos
  end

  def yearly_popular_repos
    render :json => Repo.year_popular_repos
  end



end
