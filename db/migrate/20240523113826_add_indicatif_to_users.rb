class AddIndicatifToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :indicatif, :string
  end
end
