Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact_us'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root 'static_pages#home'
end
