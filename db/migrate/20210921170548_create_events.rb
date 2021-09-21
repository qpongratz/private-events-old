class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.time :date
      t.string :place

      t.timestamps
    end
  end
end
