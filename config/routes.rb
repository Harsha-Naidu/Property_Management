Rails.application.routes.draw do
  get("/",{to:"welcome#home", as: :root})

  resource :welcome, only:[:home]
  resources :posts do
    resources :comments, only:[:create, :destroy]
    end

  resources :users, only:[:new, :create]
  resource :session, only:[:new, :create, :destroy]
end
