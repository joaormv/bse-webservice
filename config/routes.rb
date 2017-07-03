Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/clientes/show_by_cpf/:query' => 'clientes#show_by_cpf'

  resources :clientes
  resources :emprestimo
  resources :operadores
end
