class CreateHistoryDrawings < ActiveRecord::Migration
  def change
    create_table :history_drawings do |t|
      t.text :x_pos, :limit => '100000'
      t.text :y_pos, :limit => '100000'
      t.text :drag_pos, :limit => '100000'
      t.integer :drawing_id

      t.timestamps
    end
  end
end
