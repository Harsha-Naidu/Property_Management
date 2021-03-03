Rails.application.routes.draw do
  get("/",{to:"welcome#home", as: :root})

  resource :welcome, only:[:home]
  resources :posts do
    resources :comments, only:[:create, :destroy]
    end
end
