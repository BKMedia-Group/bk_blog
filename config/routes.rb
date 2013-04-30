Rails.application.routes.draw do
  resources :blogs do
    get :manage, on: :collection
  end
  resources :blog_categories do
    get :manage, on: :collection
  end
end
