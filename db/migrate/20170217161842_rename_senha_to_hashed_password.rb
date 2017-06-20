class RenameSenhaToHashedPassword < ActiveRecord::Migration[5.0]
  def change
  	rename_column :operadors, :senha, :hashed_password
  end
end
