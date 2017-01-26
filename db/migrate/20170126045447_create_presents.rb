class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.integer :user_id
      t.integer :user_type
      t.text    :product_name
      t.text    :image
      t.integer :product_price
      t.integer :who_from
      t.text    :who_from_other
      t.integer :who_for
      t.text    :who_for_other
      t.integer :when
      t.text    :when_other
      t.integer :rate
      t.text    :text
      t.timestamps
    end
  end
end
