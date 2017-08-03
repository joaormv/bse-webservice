class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|

    	t.integer :cliente_id, null: false
      t.integer :agreement_id, null: false
    	t.string :funcao, limit: 100, null: false
    	t.string :matricula, limit: 20, null: false
    	t.string :senha, limit: 10
    	t.string :orgao, limit: 30

      t.timestamps
    end
  end
end
