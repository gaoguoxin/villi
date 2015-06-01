class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.String :title
      t.Double :price
      t.String :content

      t.timestamps null: false
    end
  end
end
