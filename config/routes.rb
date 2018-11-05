Rails.application.routes.draw do
  resources :eventos do
    collection do
      get 'processar_checkin'
      get 'checkout_all'
    end
  end
  resources :salas
  resources :turmas
  resources :configuracoes, only: [:index, :update]
  devise_for :usuarios
  mount Ckeditor::Engine => '/ckeditor'
  resources :pessoas do
  	get 'novo_responsavel'
  	get 'nova_crianca'
  	get 'editar_familia'
  	get 'editar_responsavel'
  	get 'editar_crianca'
  	collection do
  	  get 'nova_familia'
    end
  end
  # Eventos
  get 'eventos/:pessoa_id/checkin', to: 'eventos#checkin', as: 'checkin'
  get 'eventos/:pessoa_id/checkout', to: 'eventos#checkout', as: 'checkout'
  get 'eventos/:pessoa_id/historico', to: 'eventos#historico', as: 'historico'
  get 'eventos/processar_checkin', to: 'eventos#processar_checkin', as: 'processar_checkin'
  get 'eventos/checkout_all', to: 'eventos#checkout_all', as: 'checkout_all'
  # Turmas
  get 'turmas/:turma_id/alunos', to: 'turmas#alunos', as: 'alunos'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
