class CreateEnderecos < ActiveRecord::Migration[5.0]
  def change
    create_table :enderecos do |t|

    	t.integer	:cliente_id
    	t.string	:rua, limit: 45, null: false
    	t.integer	:numero, limit: 5, null: false
    	t.string	:complemento, limit: 45
    	t.string	:bairro, limit: 45, null: false
    	t.string	:cidade, limit: 45, null: false
    	t.string	:estado, limit: 2, null: false
    	t.string	:cep, limit: 9, null: false

      t.timestamps
    end
  end
end
