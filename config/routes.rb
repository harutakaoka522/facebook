Rails.application.routes.draw do
  resources :blogs do #複数のroutingを作成
    collection do #ルーティングにコレクション追加
      post :confirm #POSTのconfirmを追加 confirm_blogs POST   /blogs/confirm(.:format)  blogs#confirm
    end
  end

  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
