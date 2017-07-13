class Emprestimo < ApplicationRecord

	belongs_to :cliente, optional: true
	belongs_to :agreement, optional: true

	#Ordena a pesquisa de emprestimos pela data do emprestimo
	default_scope lambda {order('emprestimos.data_emprestimo')}

	#Validação de campos obrigatórios
	validates_presence_of :valor, :qnt_parcelas, :valor_parcelas, :banco

	#Validação de tamanho de campos
	validates_length_of :valor, :maximum => 9
	validates_length_of :qnt_parcelas, :maximum => 3
	validates_length_of :valor_parcelas, :maximum => 9
	validates_length_of :banco, :maximum => 40
	validates_length_of :corretora, :maximum => 40
end
