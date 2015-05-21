PhoneDevise::Application.routes.draw do
  devise_for :users

  post '/send_captcha' => 'home#send_captcha'

  root 'home#index'

end
