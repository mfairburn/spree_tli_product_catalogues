Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :products do
      resources :catalogues do
        collection do
          post :update_positions
        end
      end
    end
  end
end
