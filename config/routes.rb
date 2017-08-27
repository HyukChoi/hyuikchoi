Rails.application.routes.draw do

  devise_for :users
  devise_for :models
  get 'home/index'

  post 'home/create'

  get 'home/destroy/:id' => 'home#destroy'

  get 'home/read/:id' => 'home#read'

  get'home/update/:id' => 'home#update'

  post 'home/real_update/:id' => 'home#real_update'

  root 'home#index'

  #reply part
  get 'home/reply_mention/:id'=>'home#reply_mention'

  get 'home/reply_destroy/:id'=>'home#reply_destroy'

  get 'home/reply_update/:id'=>'home#reply_update'

  get 'home/real_reply_update/:id'=>'home#real_reply_update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
