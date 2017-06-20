class CreateEmprestimos < ActiveRecord::Migration[5.0]
  def change
    create_table :emprestimos do |t|

    	t.integer :cliente_id
    	t.float :valor, limit: 9, null: false
    	t.integer :qnt_parcelas, limit: 3, null: false
    	t.float	:valor_parcelas, limit: 9, null: false
    	t.date	:data_emprestimo
    	t.string :banco, limit: 40, null: false
    	t.string :corretora, limit: 40

      t.timestamps
    end
  end
end
