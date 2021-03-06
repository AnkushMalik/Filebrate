Rails.application.routes.draw do
  resources :folders
  resources :assets
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  match "assets/get/:id" => "assets#get",via: [:get, :post], :as => "download"
  match "browse/:folder_id" => "home#browse",via: [:get, :post], :as => "browse"
  match "browse/:folder_id/new_folder" => "folders#new",via: [:get, :post], :as => "new_sub_folder"
end
