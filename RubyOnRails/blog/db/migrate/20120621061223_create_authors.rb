class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
	t.integer :weblog_id
	t.integer :user_id
	t.timestamps
    end
  end
end
