class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|

    	t.string :nome, limit: 45, null: false
    	t.string :cpf, limit: 14, null: false
    	t.string :rg, limit: 15, null: false
    	t.date 	 :data_nasc
    	t.string :tel, limit: 15, null: false
    	t.string :tel2, limit: 15
    	t.string :email, limit: 35


      t.timestamps
    end
  end
end
