Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks" }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'

  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'

  end

  get 'weekly_popular_repos', to: 'repos#weekly_popular_repos'
  get 'ruby_popular_repos', to: 'repos#ruby_popular_repos'
  get 'projects', to: 'users#all_projects'
  get 'yearly_popular_repos', to: 'repos#yearly_popular_repos'

end
