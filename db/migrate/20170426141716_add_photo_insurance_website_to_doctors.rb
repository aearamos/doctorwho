class AddPhotoInsuranceWebsiteToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :photo, :string
    add_column :doctors, :insurance, :string
    add_column :doctors, :website, :string
  end
end
