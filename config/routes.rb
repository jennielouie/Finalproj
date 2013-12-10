FinalProj::Application.routes.draw do

  root :to => 'projects#new'
  resources :projects
  resources :users

end
