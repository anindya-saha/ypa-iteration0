class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :rsvp
      t.boolean :signin
      t.string :created_by
      t.string :updated_by
      t.boolean :deleted

      t.timestamps
    end
  end
end
