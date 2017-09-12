class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :password_digest
      t.string :username

      t.timestamps
    end
  end
end
