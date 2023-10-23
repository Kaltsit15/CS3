Rails.application.routes.draw do
    get 'top/main'
    post 'top/login'
    root 'top#main'
    get 'top/logout'
    get 'top/newuser'
    post 'top/saveuser'
end
