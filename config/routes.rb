Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :restaurants, only: %i[index new create show] do
    # remove new for reviews when the form is in the restaurants/show page
    resources :reviews, only: %i[new create]
  end
end
