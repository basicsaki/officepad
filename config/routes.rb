Rails.application.routes.draw do
  resources :user_roles
  resources :roles
  resources :notice_boards
  resources :suggestions
  resources :categories do
    resources :questions do
      resources :answers do 
        resources :answer_comments
      end
    end
  end

  get 'search', to: 'questions#search'

  resources :question_tags
  resources :tags
  root to: 'pages#home'

  get 'pages/about'

  get 'pages/contact'

  get 'pages/process'

  
  resources :question_suggestions
  
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
