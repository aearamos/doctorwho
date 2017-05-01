class AddDoctorstatusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :doctorstatus, :string, default: "false"
  end
end
