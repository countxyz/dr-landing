Rails.application.routes.draw do
  get 'alternative', to: 'alternatives#landing'

  root 'home#landing'
end
