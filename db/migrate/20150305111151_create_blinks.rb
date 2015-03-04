class CreateBlinks < ActiveRecord::Migration
  def change
    create_table :blinks do |b|
      b.string :blink_text
      b.integer :user_id
      b.timestamps
    end
  end
end
