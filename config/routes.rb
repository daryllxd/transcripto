# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  post 'graphql' => 'graphqls#create'
  get '/pages/*id' => 'pages#show', as: :page, format: false

  resource :dashboard, only: :show

  namespace :talk_summaries do
    resource :top
  end

  resources :talk_summaries, only: %w[create index show]

  root 'pages#index'
end
