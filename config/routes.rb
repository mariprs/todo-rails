Rails.application.routes.draw do
  resources :list_groups, only: [ :index, :create, :destroy ] do
    resources :tasks, only: [  :index, :create, :destroy ] do
      member do
        patch :toggle
        get :toggle
      end
    end
  end
end
