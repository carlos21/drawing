class DrawingController < ApplicationController
  before_filter :init_drawing

  def init_drawing 
    @drawing = Drawing.find(1)
    @user = User.get_or_set_user(session)

    @history_drawings = HistoryDrawing.where(:drawing_id => 1).order('created_at desc').limit(1)

    if @history_drawings.any?
      @history_drawing = @history_drawings[0]
    end
  end

  def index
    respond_to do |format|
      format.html
    end
  end

end
