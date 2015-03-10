Rails.application.routes.draw do

   root 'blank#index'

   resources :blank

   get '/sign-up' => 'registrations#new'
   post '/sign-up' => 'registrations#create'
   get '/sign-in' => 'authentication#new'
   post '/sign-in' => 'authentication#create'
   get '/sign-out' => 'authentication#destroy'


end
