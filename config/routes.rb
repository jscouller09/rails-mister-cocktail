Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: %i[new create index show] do
    resources :doses, only: %i[new create destroy]
  end
end
