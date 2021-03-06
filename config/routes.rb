Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :movies
  resources :bookmarks, only: %i[destroy]
  resources :lists, only: %i[index new show create] do
    resources :bookmarks, only: %i[new create]
  end
end
