class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean	:up
      t.integer	:user_id
      t.integer	:link_id
      t.timestamps
    end
  end
end
