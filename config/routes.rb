Rails.application.routes.draw do
  root "operations#new"
  post "/operations", to: "operations#create"
end
