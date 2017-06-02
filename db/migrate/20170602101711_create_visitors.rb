class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.text :image
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
