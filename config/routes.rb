StudentManage::Application.routes.draw do
  devise_for :users
  get "" => "home#index", as: "home"
  root to: "home#index"
end
