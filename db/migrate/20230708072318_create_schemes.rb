class CreateSchemes < ActiveRecord::Migration[6.1]
  def change
    create_table :schemes do |t|
      t.string :url
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
