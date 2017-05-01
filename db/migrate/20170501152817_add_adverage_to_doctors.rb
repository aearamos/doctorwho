class AddAdverageToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :average_rating, :float
  end
end
