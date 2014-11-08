class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :primary_key => :user_id do |t|
      t.string :first_name, :null => false
      t.string :last_name
      t.string :password, :null => false
      t.date :dob, :null => false
      t.string :email, :null => false
      t.string :phone
      t.string :organization
      t.string :interests
	  t.boolean :admin, :default => false, :null => false
      t.string :created_by
      t.string :updated_by
      t.boolean :deleted

      t.timestamps
    end
  end
end
