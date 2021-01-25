class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,    nill:false
      t.text       :explanation,     nill:false
      t.integer    :category_id,     nill:false
      t.integer    :state_id,        nill:false
      t.integer    :delivery_fee_id, nill:false
      t.integer    :prefecture_id,   nill:false
      t.integer    :required_day_id, nill:false
      t.integer    :price,           nill:false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
