Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Batch
    get '/batch'          => 'batch#index',  as: 'batch_index'
    get '/batch/new'      => 'batch#new',    as: 'new_batch'
    post '/batch'         => 'batch#create', as: 'create_batch'
    get '/batch/:id'      => 'batch#show',   as: 'show_batch'
    get '/batch/:id/edit' => 'batch#edit',   as: 'edit_batch'
    put '/batch/:id'      => 'batch#update', as: 'update_batch'

  # Courses
    get '/course/index', to: 'courses#index', as: 'index_courses'
    get '/course/new' => 'courses#new', as: 'new_courses'
    post '/course/create', to: 'courses#create', as: 'create_courses'
    get '/course/:id/edit', to: 'courses#edit', as: 'edit_courses'
    patch '/course/:id/update', to: 'courses#update', as:'update_course'

end
