class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
      t.string     :postal,          null: false
      t.integer    :prefecture_id,   null: false
      t.string     :minicipalities,  null: false
      t.string     :building
      t.string     :residence,       null: false
      t.string     :phone,           null: false
      t.references :purchase_record, foreign_key: true
      t.timestamps
    end
  end
end
