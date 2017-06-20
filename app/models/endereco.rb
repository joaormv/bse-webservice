class Endereco < ApplicationRecord
	belongs_to :cliente, optional: true

	#Validação de campos obrigatórios
	validates_presence_of :rua, :numero, :bairro, :cidade, :estado, :cep

	#Validação de tamanho de campos
	validates_length_of :rua, :maximum => 45
	validates_length_of :numero, :within => 1..5
	validates_length_of :complemento, :maximum => 45
	validates_length_of :bairro, :maximum => 45
	validates_length_of :cidade, :maximum => 45
	validates_length_of :estado, :is => 2
	validates_length_of :cep, :is => 9
end
