class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :organizer
      t.text :localtion
      t.references :identity, index: true

      t.timestamps
    end
  end
end
