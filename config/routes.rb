Rails.application.routes.draw do

  root 'home#index'
  get 'home/index' => 'home#index'

  devise_for :students, controllers: {
    sessions:       'students/sessions',
    passwords:      'students/passwords',
    registrations:  'students/registrations'
  }
  resources :students, only: [:index, :show]
  # get 'students/index' => 'students#index'
  # get 'students/show' => 'students#show'


  devise_for :teachers, controllers: {
    sessions:       'teachers/sessions',
    passwords:      'teachers/passwords',
    registrations:  'teachers/registrations'
  }
  resources :teachers, only: [:index, :show]
  # get 'teachers/index' => 'teachers#index'
  # get 'teachers/show' => 'teachers#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :student_followings, only: [:show, :create, :destroy]
  resources :teacher_followings, only: [:show, :create, :destroy]

  resources :rooms, only: [:show, :create] do
    resources :messages, only: [:create]
  end


end
