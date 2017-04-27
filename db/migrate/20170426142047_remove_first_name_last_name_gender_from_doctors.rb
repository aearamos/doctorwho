class RemoveFirstNameLastNameGenderFromDoctors < ActiveRecord::Migration[5.0]
  def change
    remove_column :doctors, :first_name, :string
    remove_column :doctors, :last_name, :string
    remove_column :doctors, :gender, :string
  end
end
