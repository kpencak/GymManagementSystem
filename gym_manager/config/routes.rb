Rails.application.routes.draw do
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
