Rails.application.routes.draw do
  resources :programs
  resources :universities
  get "about", to: "pages#about"
  root "universities#index"
end
