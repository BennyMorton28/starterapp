Rails.application.routes.draw do
  get 'blackjack/index'
  # Resources
  resources "sessions"
  resources "users"
  
  # Login/logout
  get("/login", { :controller => "sessions", :action => "new" })
  get("/logout", { :controller => "sessions", :action => "destroy" })

  # Define the root route
  get("/", { :controller => "users", :action => "new" })

  Rails.application.routes.draw do
    # Define a route for the Blackjack form submission
    get 'blackjack', to: 'blackjack#index', as: 'blackjack'
    # This creates a path helper `blackjack_path` that routes to BlackjackController#index
  end
end
