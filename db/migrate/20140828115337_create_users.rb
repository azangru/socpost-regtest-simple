class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :patronymic_name
      t.date :date_of_birth
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
