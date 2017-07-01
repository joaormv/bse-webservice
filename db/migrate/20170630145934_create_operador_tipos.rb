class CreateOperadorTipos < ActiveRecord::Migration[5.0]
  def change
	create_table :operador_tipos do |t|

		t.string	:tipo, limit: 20, null: false

	  t.timestamps
	end
  end
end
