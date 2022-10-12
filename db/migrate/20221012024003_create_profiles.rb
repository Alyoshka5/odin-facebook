class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.text :about
      t.text :hobbies
      t.string :city

      t.belongs_to :user

      t.timestamps
    end
  end
end
