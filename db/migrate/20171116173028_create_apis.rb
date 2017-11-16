class CreateApis < ActiveRecord::Migration[5.0]
  def change
    create_table :apis do |t|
      t.string :name
      t.text :description
      t.string :auth
      t.boolean :https
      t.boolean :paid
      t.string :link
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
