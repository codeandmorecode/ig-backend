Rails.application.routes.draw do
  get '/photos/searchlocation/:country/:state/:city', to: 'photos#searchlocation', as: 'searchlocation'
  # get '/photos/searchlandmark/:landmark', to: 'photos#searchlandmark', as: 'searchlandmark'
  resources :photos

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #localhost:3000/photos?country=colombia&state=antioquia&city=guatape

end
