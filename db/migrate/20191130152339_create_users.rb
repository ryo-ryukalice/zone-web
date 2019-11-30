class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :account_id
      t.string :password_digest
      t.string :api_token

      t.timestamps
    end
  end
end
