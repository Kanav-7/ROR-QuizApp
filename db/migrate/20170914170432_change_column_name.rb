class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	 change_column :users, :type, :boolean, :default => false
  	 rename_column :users, :type, :user_type
  end
end
