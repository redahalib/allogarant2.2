class CreateCertificats < ActiveRecord::Migration[7.1]
  def change
    create_table :certificats do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
