class AddDefaultsToProfileInfo < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :first_name, :string, default: ""
    change_column :profiles, :last_name, :string, default: ""
    change_column :profiles, :email, :string, default: ""
  end
end
