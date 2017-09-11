require 'sidekiq/web'

Rails.application.routes.draw do
  get 'home/index'
  get 'home/upload'
  post 'home/blast'
  post 'home/calling'
  post 'home/sms'

  root 'home#index'

  mount Sidekiq::Web => '/sidekiq'
end
