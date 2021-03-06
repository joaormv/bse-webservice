class Cliente < ApplicationRecord
	
	#Relacionamento 1 > 1
	# :dependent => :destroy **** opção para remover esses campos quando o cliente for removido ****
	has_one :endereco, :dependent => :destroy

	#Relacionamento 1 > N
	has_many :emprestimos, :dependent => :destroy
	has_many :positions, :dependent => :destroy

	#Ordena a pesquisa de clientes sempre pelo nome e em ordem alfabética
	default_scope lambda {order('clientes.nome')}

	#Aceita atributos aninhados vindos de endereço e emprestimo
	accepts_nested_attributes_for :endereco
	accepts_nested_attributes_for :emprestimos, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :positions, reject_if: :all_blank, allow_destroy: true

	#Validação de presença de campos
	validates_presence_of :nome, :cpf, :rg, :tel

	#Validação se o CPF é unico
	validates_uniqueness_of :cpf

	#Validação de tamanho de campos
	validates_length_of :nome, :maximum => 45
	validates_length_of :cpf, :is => 14
	validates_length_of :rg, :maximum => 15
	validates_length_of :tel, :maximum => 15
	validates_length_of :tel2, :maximum => 15
	validates_length_of :email, :maximum => 35
end
