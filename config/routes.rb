StudentManage::Application.routes.draw do

  namespace :admin do
    resources :news
  end

  namespace :admin do
    get "home" => "home#index"
    resources :users
  end

  namespace :xuegongchu do
    get "home" => "home#index"
  end

  namespace :student do
    get "home" => "home#index"
    resources :scores
  end

  devise_for :users
  get "" => "home#index", as: "home"
  root to: "home#index"
end
