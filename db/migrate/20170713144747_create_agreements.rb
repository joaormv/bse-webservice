class CreateAgreements < ActiveRecord::Migration[5.0]
  def change
    create_table :agreements do |t|

    	t.string :description, null: false

      t.timestamps
    end
  end
end
