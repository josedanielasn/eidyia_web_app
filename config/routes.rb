Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# Courses
  get '/course/index'=> 'courses#index', as: 'index_courses'
  get '/course/new' => 'courses#new', as: 'new_courses'
  post '/course/create'=> 'courses#create', as: 'create_courses'
  get '/course/:id/edit'=> 'courses#edit', as: 'edit_courses'
  patch '/course/:id/update'=> 'courses#update', as:'update_courses'
    
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

#video 
 get '/videos'              => 'videos#index',  as: 'videos' 
 get '/videos/new'          => 'videos#new',    as: 'new_video'
 post '/videos'             => 'videos#create'
 get '/videos/:id'          => 'videos#show',   as: 'video' 
 get '/videos/:id/edit'     => 'videos#edit',   as: 'edit_video'
 patch '/videos/:id'        => 'videos#update'
 delete '/videos/:id'       => 'videos#destroy'
#video routes end

#Program 
  get '/program/index' =>  'programs#index', as: 'index_programs'
  get '/program/new' => 'programs#new', as: 'new_programs'
  post '/program/create'=>  'programs#create', as: 'create_programs'
  get '/program/:id' => 'programs#show', as: 'show_programs'
  get '/program/:id/edit'=> 'programs#edit', as: 'edit_programs'
  patch '/program/:id/update'=> 'programs#update', as:'update_programs'

# #User_program 
#   get '/user_program', to: 'user_programs#index', as: 'index_user_programs'
#   get '/user_program/new' => 'user_programs#new', as: 'new_user_programs'
#   post '/user_program/create', to: 'user_programs#create', as: 'create_user_programs'
#   get '/user_program/:id/edit', to: 'prouser_programsgrams#edit', as: 'edit_user_programs'
#   patch '/user_program/:id/update', to: 'user_programs#update', as:'update_user_programs'

