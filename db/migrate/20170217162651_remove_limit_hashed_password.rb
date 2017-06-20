class RemoveLimitHashedPassword < ActiveRecord::Migration[5.0]
  def change
  	change_column :operadors, :hashed_password, :string, :limit => nil
  end
end
