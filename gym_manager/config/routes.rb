Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:index]
      resources :cards, only: [:index]
      resources :lockers, only: [:index]
      resources :memberships, only: [:index]
      resources :equipment, only: [:index]
    end
  end
end
