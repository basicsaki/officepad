Rails.application.routes.draw do
  resources :notice_boards
  resources :suggestions
  resources :categories
  resources :question_tags
  resources :tags
  root to: 'pages#home'

  get 'pages/about'

  get 'pages/contact'

  get 'pages/process'

  resources :answer_comments
  resources :answers
  resources :question_suggestions
  resources :questions

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
