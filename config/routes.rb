Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :personas
  resources :tipo_documentos
  resources :localidads
  resources :provincia
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'localidads/:provincia_id/provincia' => 'localidads#localidades', as: :localidades
end
