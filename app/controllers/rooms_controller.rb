class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if student_signed_in?
      if @room.student.id == current_student.id
        @teacher = @room.teacher
      else
        redirect_to "/"
      end
    elsif teacher_signed_in?
      if @room.teacher.id == current_teacher.id
        @student = @room.student
      else
        redirect_to "/"
      end
    else
      redirect_to "/"
    end
  end

  def create
    if student_signed_in?
      @room = Room.new(room_teacher_params)
      @room.student_id = current_student.id
    elsif teacher_signed_in?
      @room = Room.new(room_student_params)
      @room.teacher_id = current_teacher.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to room_path(@room.id)
    else
      redirect_to "/"
    end
  end
end

private
def room_student_params
  params.require(:room).permit(:student_id)
end

def room_teacher_params
  params.require(:room).permit(:teacher_id)
end