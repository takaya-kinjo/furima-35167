class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references    :user, null: false, foreign_key: true
      t.string        :title
      t.text          :comment
      t.integer       :category_id
      t.integer       :quantity_id
      t.integer       :delivery_payment_id
      t.integer       :delivery_prefecture_id
      t.integer       :delivery_time_id
      t.integer       :price

      t.timestamps
    end
  end
end
