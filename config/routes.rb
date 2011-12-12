
Rails0::Application.routes.draw do

  match 'flows' => 'flows#index'
  match 'flows/:id' => 'flows#launch', :as => :launch_flow, :via => :post

  # routes to RuoteKit
  match '/_ruote' => RuoteKit::Application
  match '/_ruote/*path' => RuoteKit::Application
end

