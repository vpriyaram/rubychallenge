class Repo < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :stars, as: :starable

  def self.week_popular_repos
    repo_hash = Star.select(:starable_id).group(:starable_id).where(starable_type: 'Repo').where("created_at >= ?",1.week.ago.utc).order(:starable_id).count
    repo_ids = repo_hash.keys.first(10)
    Repo.find(repo_ids)
  end

  def self.year_popular_repos
    repo_hash = Star.select(:starable_id).group(:starable_id).where(starable_type: 'Repo').where("created_at >= ?",1.year.ago.utc).order(:starable_id).count
    repo_ids = repo_hash.keys.first(10)
    Repo.find(repo_ids)
  end

  def self.ruby_popular_repos
    ruby_repos = Project.joins(:repo).where(language: 'ruby').pluck(:repo_id)
    h = Star.select(:starable_id).group(:starable_id).where(starable_type: 'Repo').where("created_at >= ?",1.month.ago.utc).where(starable_id: ruby_repos).order(:starable_id).count
    repo_ids = h.keys.first(10)
    Repo.find(repo_ids)
  end



end
