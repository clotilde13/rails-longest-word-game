Rails.application.routes.draw do
  get 'new', to: 'game#new', as: :new
  post 'scores', to: 'game#scores', as: :scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
