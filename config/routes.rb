StudentManage::Application.routes.draw do


  namespace :admin do
    get "home" => "home#index"
  end

  namespace :xuegongchu do
    get "home" => "home#index"
  end

  namespace :student do
    get "home" => "home#index"
  end

  devise_for :users
  get "" => "home#index", as: "home"
  root to: "home#index"
end
