class User < ApplicationRecord
  has_and_belongs_to_many :repos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def projects
    puts "user name "
    puts self.name
    repo_ids = self.repos.pluck(:repo_id)
    Project.joins(:repo).where(repo_id: repo_ids).pluck(:name,:language)
  end


end
