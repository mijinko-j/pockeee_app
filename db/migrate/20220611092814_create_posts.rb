class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.date       :day,        null: false
      t.references :item,       null: false, foreign_key: true
      t.references :user,       null: false, foreign_key: true
      t.references :member,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
