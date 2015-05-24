Rails.application.routes.draw do

  root 'static_pages#index'

  devise_for :users
  devise_for :admins, :skip => :sessions
  resource :admin do
    resources :teachers
    resources :students
  end
  devise_for :teachers, :skip => :sessions
  devise_for :students, :skip => :sessions

end
