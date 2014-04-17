StudentManage::Application.routes.draw do


  namespace :admin do
    get "home" => "home#index"
    resources :zhuanyes
    resources :application_dates
    resources :news
    resources :applications
    resources :users
    resources :xueyuans
  end

  namespace :xuegongchu do
    get "home" => "home#index"
    resources :reward_applications, only: [:index, :show] do
      member do
        get :change
      end
    end
  end

  namespace :student do
    resources :reward_applications do
      member do
        get :change
      end
    end
    resources :person_infos, except: [:index, :destroy]
    get "home" => "home#index"
    resources :scores
  end

  devise_for :users
  get "" => "home#index", as: "home"
  root to: "home#index"
end
