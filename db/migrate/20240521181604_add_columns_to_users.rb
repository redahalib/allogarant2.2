class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :need, :string
    add_column :users, :city, :string
    add_column :users, :budget, :integer
    add_column :users, :step, :string
    add_column :users, :role, :string
  end
end
