Rails.application.routes.draw do
  root 'oembeds#index'

  get '/search', to: "oembeds#search", as: :search
end
