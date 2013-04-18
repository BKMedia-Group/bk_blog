Rails.application.routes.draw do
  get "blog_categories/index"

  get "blog_categories/show"

  get "blog_categories/new"

  get "blog_categories/create"

  get "blog_categories/edit"

  get "blog_categories/update"

  get "blog_categories/manage"

  get "blog_categories/destroy"

  resources :blogs do
    get :manage, on: :collection
  end
  resources :blog_categories do
    get :manage, on: :collection
  end
end
