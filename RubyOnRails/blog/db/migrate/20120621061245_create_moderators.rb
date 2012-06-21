class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
	t.integer :weblog_id
	t.integer :user_id
	t.timestamps
    end
  end
end
