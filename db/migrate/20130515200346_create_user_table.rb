class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :password
      t.string :blog_title
    end
  end
end
