class Position < ApplicationRecord

#Relacionamentos 
belongs_to :cliente, optional: true
belongs_to :agreement, optional: true

#Validações quando o objeto for criado
validates_presence_of :funcao, :agreement_id, :cliente_id, :matricula

end
