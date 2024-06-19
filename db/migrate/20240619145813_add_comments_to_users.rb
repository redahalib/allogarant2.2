class AddCommentsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :comments, :text
  end
end
