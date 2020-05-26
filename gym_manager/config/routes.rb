Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:index, :new, :create, :show]
      resources :cards, only: [:index, :new]
      resources :lockers, only: [:index, :new]
      resources :memberships, only: [:index, :new]
      resources :equipment, only: [:index, :new]
    end
  end
end
