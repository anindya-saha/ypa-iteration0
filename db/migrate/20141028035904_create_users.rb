class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :primary_key => :user_id do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.date :dob
      t.string :email
      t.string :phone
      t.string :organization
      t.string :interests
      t.string :created_by
      t.string :updated_by
      t.boolean :deleted

      t.timestamps
    end
  end
end
