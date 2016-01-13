# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
resources :csats, only: [:index, :new, :create] do

end
resources :csat_configs, only: [:create, :update] do
  member do
    put :trigger 
  end
end
