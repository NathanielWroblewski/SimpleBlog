class CreateTagTable < ActiveRecord::Migration
  def change
    create_table :tags  do |t|
      t.text :text
    end
  end
end

