Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '/api/v1', module: 'api/v1', as: 'api_v1' do
    resources :drivers, only: :none do
      resources :rides, only: :index
    end
  end

  # Defines the root path route ("/")
  # root "api/v1/rides#index"
end
