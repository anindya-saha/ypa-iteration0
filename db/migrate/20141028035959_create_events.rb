class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, :primary_key => :event_id do |t|
      t.string :name
      t.text :description
      t.date :from_date
      t.date :to_date
      t.time :from_time
      t.time :to_time
      t.string :venue
      t.string :category
      t.integer :min_before_start
      t.integer :max_before_end
      t.string :created_by
      t.string :updated_by
      t.boolean :deleted

      t.timestamps
    end
  end
end
