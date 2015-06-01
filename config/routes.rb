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
        get '/add_teacher', to: 'group_assignments#new_group_teacher'
        post '/create_group_teacher', to: "group_assignments#create_group_teacher"
        get '/add_student', to: "group_assignments#new_group_student"
        patch '/create_group_student', to: "group_assignments#create_group_student"
        get '/add_lesson', to: "group_assignments#new_group_lesson"
        post '/create_group_lesson', to: "group_assignments#create_group_lesson"
      end
    end
  end
  devise_for :teachers, :skip => :sessions
  devise_for :students, :skip => :sessions

end
