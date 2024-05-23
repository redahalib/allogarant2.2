class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :message
      t.string :email
      t.string :full_name
      t.string :subject
      t.string :phone

      t.timestamps
    end
  end
end
