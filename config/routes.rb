Rails.application.routes.draw do
  root 'artists#index'
  
  resources :artists do
    resources :albums
  end
  
  scope 'albums/:album_id', as: 'album' do
    resources :songs, only: [:new, :create]
  end
  
end
