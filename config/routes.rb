Rails.application.routes.draw do

  devise_for :authors

  root to: 'blog/posts#index'
 
  # selain menggunakan namespace kita juga bisa menggunakan scope untuk kebutuhan yang lebih spesifik
  #scope module: 'authors', path: 'authors', as: 'authors' do 
  #  get 'account' => 'accounts#edit', as: :account
  #  resources :posts do 
  #    #karena kita ingin mengupdate maka kita gunakan put :namaaction dan on: :member ini artinya berlaku untuk suatu data tertentu karena kita ingin mengupdate 1 pint atau
  #    #biasanya on: :member ini digunakan pada edit,update,delete intinya yg berkaitan dengan id
  #    put 'publish' => 'posts#publish', on: :member 
  #    put 'unpublish' => 'posts#unpublish', on: :member 
  #  end
  #end

  # buat folder author di dalem folder controller 
  # /authors/posts
  namespace :authors do 
    get '/account' => 'accounts#edit', as: :account
    put '/info'    => 'accounts#update_info', as: :info
    put '/change_password' => 'accounts#change_password', as: :change_password
    # resources :posts
    resources :posts do 
      #karena kita ingin mengupdate maka kita gunakan put :namaaction dan on: :member ini artinya berlaku untuk suatu data tertentu karena kita ingin mengupdate 1 pint atau
      #biasanya on: :member ini digunakan pada edit,update,delete intinya yg berkaitan dengan id
      put 'publish' => 'posts#publish', on: :member 
      put 'unpublish' => 'posts#unpublish', on: :member 
    end
  end

  # buat folder blog di dalem folder controller 
  # /blog/
  scope module: 'blog' do 
    get 'about'     => 'pages#about', as: :about
    get 'contact'   => 'pages#contact', as: :contact
    get 'posts'     => 'posts#index', as: :posts
    get 'posts/:id' => 'posts#show', as: :post
    # resources :posts
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
