Rails.application.routes.draw do

   root 'blanks#index'

   resources :users, only: [:create]
   resources :blanks

   get '/sign-up' => 'registrations#new'
   post '/sign-up' => 'registrations#create'
   get '/sign-in' => 'authentication#new'
   post '/sign-in' => 'authentication#create'
   get '/sign-out' => 'authentication#destroy'


end
