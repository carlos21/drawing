class HistoryDrawingController < ApplicationController

  def save_history_drawing
    drawing = Drawing.find(1)
    user = User.get_or_set_user(session)

    history_drawing = HistoryDrawing.new
    history_drawing.x_pos = params[:x_pos].join(",")
    history_drawing.y_pos = params[:y_pos].join(",")
    history_drawing.drag_pos = params[:drag_pos].join(",")
    history_drawing.user_id = user.id
    history_drawing.drawing_id = drawing.id
    history_drawing.created_at = Time.now
    history_drawing.updated_at = Time.now

    data = history_drawing.attributes
    data[:user] = user.attributes

    if history_drawing.save
      Pusher[drawing.name].trigger('receive_drawing', data)
      render :text => 'success'
    else
      render :text => 'error'
    end

  end

end
