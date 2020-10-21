Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root controller: :announcements, action: :index

  # announcements
  get '/announcements', to: 'announcements#index', as: 'index_announcement'

  # Courses
  get '/course/index', to: 'courses#index', as: 'index_courses'
  get '/course/new'         => 'courses#new', as: 'new_courses'
  post '/course/create'     => 'courses#create', as: 'create_courses'
  get '/course/:id/edit'    => 'courses#edit', as: 'edit_courses'
  patch '/course/:id/update'=> 'courses#update', as:'update_courses'

    
  #batch
  get '/batch'          => 'batch#index',  as: 'batch_index'
  get '/batch/new'      => 'batch#new',    as: 'new_batch'
  post '/batch'         => 'batch#create', as: 'create_batch'
  get '/batch/:id'      => 'batch#show',   as: 'show_batch'
  get '/batch/:id/edit' => 'batch#edit',   as: 'edit_batch'
  put '/batch/:id'      => 'batch#update', as: 'update_batch'

#session 
  get '/session'          => 'session#index', as: 'session_index'
  get '/session/new'      => 'session#new', as: 'new_session'
  post '/session'         => 'session#create', as: 'create_session'
  get '/session/:id'      => 'session#show', as: 'show_session'
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

  #comment
  post '/videos/:video_id/comments'             => 'comments#create', as: 'video_comments'



  #Program 
  get '/program/index'       =>  'programs#index', as: 'index_programs'
  get '/program/new'         => 'programs#new', as: 'new_programs'
  post '/program/create'     =>  'programs#create', as: 'create_programs'
  get '/program/:id'         => 'programs#show', as: 'show_programs'
  get '/program/:id/edit'    => 'programs#edit', as: 'edit_programs'
  patch '/program/:id/update'=> 'programs#update', as:'update_programs'


  #user
  get '/user/index'       =>  'users#index', as: 'index_users'
  get '/user/new'         => 'users#new', as: 'new_users'
  post '/user/create'     =>  'users#create', as: 'create_users'
  get '/user/:id'         =>  'users#show', as: 'show_users'
  get '/user/:id/edit'    => 'users#edit', as: 'edit_users'
  patch '/user/:id/update'=> 'users#update', as:'update_users'
end

