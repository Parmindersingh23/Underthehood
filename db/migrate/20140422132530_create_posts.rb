class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :views
      t.references :user
      t.references :answer
      t.timestamps
    end
  end
end
