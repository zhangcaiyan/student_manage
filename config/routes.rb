StudentManage::Application.routes.draw do
  get "" => "home#index", as: "home"
  root to: "home#index"
end
