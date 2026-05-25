class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :planned_date
      t.string :title
      t.timestamps
      t.belongs_to :creator
    end
  end
end
