class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                null: false
      t.text       :introduction,        null: false
      t.integer    :price,               null: false
      t.string     :item_condition_id,   null: false
      t.string     :preparation_day_id,  null: false
      t.string     :postage_type_id,     null: false
      t.string     :category_id,         null: false
      t.integer    :sender_id,           null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
