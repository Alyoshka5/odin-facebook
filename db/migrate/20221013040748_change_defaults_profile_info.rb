class ChangeDefaultsProfileInfo < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :first_name, :string
    change_column :profiles, :last_name, :string
    change_column :profiles, :email, :string
    change_column :profiles, :about, :string, default: ""
    change_column :profiles, :hobbies, :string, default: ""
    change_column :profiles, :city, :string, default: ""
  end
end
