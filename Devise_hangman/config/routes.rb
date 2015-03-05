Rails.application.routes.draw do

  devise_for :users, :controllers=>{:registrations=>"users/registrations",:sessions=>"users/sessions"}
     root 'users#index'
    get '/users/sign_out' => 'devise/sessions#destroy'

  devise_scope :user do

               get '/login' => "devise/sessions#new"
               post '/login' => "devise/sessions#create"
               get "/logout"=>"devise/sessions#destroy"
               get '/signup'=>"users/registrations#new"
               get '/users/sign_out' => 'devise/sessions#destroy'

                     end
  get 'users/admin_page'

  get 'users/user_page'

  get "users/index"

  get "users/list"

  get "users/manage"

  get "users/edit_user"

  post "users/edit_user"

  get "users/reset"

  post "users/reset"
  get "users/delete"
  get "game/hangman/admin_play"

  post "game/hangman/start_game"
  get "game/hangman/start_game"

  get "game/hangman/category"

  get "game/hangman/new_game"





end
