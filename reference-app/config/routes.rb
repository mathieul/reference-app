ReferenceApp::Application.routes.draw do
  resources :contacts, except: :edit
  root to: 'Main#index'
end
