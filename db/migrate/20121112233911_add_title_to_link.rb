class AddTitleToLink < ActiveRecord::Migration
  def change
  	add_column	:links, :title, :string
  end
end
