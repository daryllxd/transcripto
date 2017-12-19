# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  post 'graphql' => 'graphqls#create'
  get '/pages/*id' => 'pages#show', as: :page, format: false

  root 'pages#index'
end
