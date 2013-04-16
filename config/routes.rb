Rails.application.routes.draw do
  resources :blogs do
    get :manage, on: :collection
  end
end
