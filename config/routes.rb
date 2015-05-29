Rails.application.routes.draw do


  root 'static_pages#index'

  devise_for :users
  devise_for :admins, :skip => :sessions
  resource :admin do
    resources :teachers
    resources :students
    resources :lessons
    resources :groups
    resources :group_assignments do
      collection do
        get '/teachers', to: 'group_assignments#teachers'
        get '/students', to: 'group_assignments#students'
        get '/lessons', to: 'group_assignments#lessons'
      end
    end
  end
  devise_for :teachers, :skip => :sessions
  devise_for :students, :skip => :sessions

end
