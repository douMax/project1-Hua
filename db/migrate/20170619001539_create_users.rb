class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.text :password_digest
      t.text :image

      t.timestamps
    end
  end
end
