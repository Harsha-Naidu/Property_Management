Rails.application.routes.draw do
  get("/",{to:"welcome#home", as: :root})

  resource :welcome, only:[:home]
end
