class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :weblog_id
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
