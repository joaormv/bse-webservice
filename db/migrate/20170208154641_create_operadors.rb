class CreateOperadors < ActiveRecord::Migration[5.0]
  def change
    create_table :operadors do |t|

    	t.string	:user, limit: 45
    	t.string	:senha, limit: 6

      t.timestamps
    end
  end
end
