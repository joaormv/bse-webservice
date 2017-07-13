class Agreement < ApplicationRecord

#Relacionamento com a tabela emprestimos
has_many :emprestimos

#Validações
validates_presence_of :description
validates_length_of :description, :maximum => 100
end
