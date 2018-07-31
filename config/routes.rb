Rails.application.routes.draw do
  root 'homes#index'

  get '/valid', to: 'homes#valid'
  get '/invalid', to: 'homes#invalid'
end
