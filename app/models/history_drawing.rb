class HistoryDrawing < ActiveRecord::Base
  attr_accessible :drag_pos, :drawing_id, :user_id, :x_pos, :y_pos
end
