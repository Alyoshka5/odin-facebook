class AddInfoToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :email, :string
    add_index :profiles, :email, unique: true
  end
end
