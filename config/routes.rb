Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Courses
  get '/course/index', to: 'courses#index', as: 'index_courses'
  get '/course/new' => 'courses#new', as: 'new_courses'
  post '/course/create', to: 'courses#create', as: 'create_courses'
  get '/course/:id/edit', to: 'courses#edit', as: 'edit_courses'
  patch '/course/:id/update', to: 'courses#update', as:'update_courses'
    
  #batch
  get '/batch'          => 'batch#index',  as: 'batch_index'
  get '/batch/new'      => 'batch#new',    as: 'new_batch'
  post '/batch'         => 'batch#create', as: 'create_batch'
  get '/batch/:id'      => 'batch#show',   as: 'show_batch'
  get '/batch/:id/edit' => 'batch#edit',   as: 'edit_batch'
  put '/batch/:id'      => 'batch#update', as: 'update_batch'

 #session 
  get '/session' => 'session#index', as: 'session_index'
  get '/session/new' => 'session#new', as: 'new_session'
  post '/session' => 'session#create', as: 'create_session'
  get '/session/:id' => 'session#show', as: 'show_session'
  get '/session/:id/edit' => 'session#edit', as: 'edit_session'
  put '/session/:id'      => 'session#update', as: 'update_session'
#session routes end

  # Program 
    get '/program/index', to: 'programs#index', as: 'index_programs'
    get '/program/new' => 'programs#new', as: 'new_programs'
    post '/program/create', to: 'programs#create', as: 'create_programs'
    get '/program/:id/edit', to: 'programs#edit', as: 'edit_programs'
    patch '/program/:id/update', to: 'programs#update', as:'update_programs'


end
