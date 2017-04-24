class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_name
      t.string :city_name
      t.string :phone
      t.string :gender
      t.text :description
      t.string :crm
      t.boolean :activity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
