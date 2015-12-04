Rails.application.routes.draw do

  get '/matches/:id' => 'matches#index'
  get '/matches/:faction' =>'matches#faction'


end
