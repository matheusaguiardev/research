Rails.application.routes.draw do

  resources :answers
  resources :questions
  resources :quizzes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users
  root 'quizzes#index'
end
