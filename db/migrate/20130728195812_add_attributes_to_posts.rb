class AddAttributesToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :title, :string
  	add_column :posts, :body, :text
  	add_column :posts, :tag, :string
  end
end
