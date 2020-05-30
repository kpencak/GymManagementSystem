Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:index, :new, :create, :show]
      resources :cards, only: [:index, :new, :create, :show]
      resources :lockers, only: [:index, :new, :create, :show]
      resources :memberships, only: [:index, :new, :create, :show]
      resources :equipment, only: [:index, :new, :create, :show]
    end
  end
end
