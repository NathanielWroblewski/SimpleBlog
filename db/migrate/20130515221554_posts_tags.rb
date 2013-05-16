class PostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |column|
      column.references :post
      column.references :tag
    end
  end
end
