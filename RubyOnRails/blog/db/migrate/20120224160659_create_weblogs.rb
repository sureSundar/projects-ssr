class CreateWeblogs < ActiveRecord::Migration
  def change
    create_table :weblogs do |t|
      t.integer :owner_id
      t.string :subdomainurl
      t.string :baselang
      t.string :region

      t.timestamps
    end
  end
end
