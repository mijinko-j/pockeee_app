class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string     :name,  null: false
      t.integer    :fixed, null: false
      t.integer    :color, null: false
      t.references :user , null: false, foreign_key: true
      t.timestamps
    end
  end
end
