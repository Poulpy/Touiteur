class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :tweet
      t.integer :user
      
      t.timestamps
    end
  end
end
