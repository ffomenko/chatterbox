Chatterbox::Application.routes.draw do
  resources :posts, :only => [:new, :create, :index]
  root :to => "posts#index"
end
