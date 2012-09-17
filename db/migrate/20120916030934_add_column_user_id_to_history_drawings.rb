class AddColumnUserIdToHistoryDrawings < ActiveRecord::Migration
  def change
    add_column :history_drawings, :user_id, :integer
  end
end
