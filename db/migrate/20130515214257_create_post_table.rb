class CreatePostTable < ActiveRecord::Migration
  def change
    create_table :posts do |column|
      column.text :body
      column.string :title, :author
      column.references :user
      column.timestamps
    end
  end
end
