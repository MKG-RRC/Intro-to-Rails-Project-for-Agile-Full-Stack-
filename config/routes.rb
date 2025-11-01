Rails.application.routes.draw do
  resources :departments
  resources :programs
  resources :universities
  get "about", to: "pages#about"
  root "universities#index"
end
