Rails.application.routes.draw do
  get '/photos/search/:country/:state/:city', to: 'photos#search', as: 'search'
  resources :photos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #localhost:3000/photos?country=colombia&state=antioquia&city=guatape

end
