Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :cards
      resources :lockers
      resources :memberships
      resources :equipment
    end
  end
end
