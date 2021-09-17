Rails.application.routes.draw do
  resources :userdats
  resources :userdata
  root :to => redirect('/upload')
  get '/upload', to: 'welcome#form', constraints: { short_code: /[a-zA-Z]+/ }
  
  post '/upload', to: 'processfile#csv'
  get  '/dbcount', to: 'processfile#dbcount' , constraints: { short_code: /[a-zA-Z]+/ }

end
