class StudentsController < ApplicationController

  before_action :authenticate_student!, except: [:show]

  def index
    @student = current_student
    if params[:search] == nil
      @teachers = Teacher.all
    elsif params[:search] == ""
      @teachers = Teacher.all
    else
      split_keyword = params[:search].split(/[[:blank:]]+/)
      @teachers = []
      split_keyword.each do |sk|
        next if sk == ""
        @teachers += Teacher.where('name like(?) or profile like(?) or subject like(?)', "%#{sk}%","%#{sk}%","%#{sk}%")
      end
      @teachers.uniq!
    end
  end

  def show
    @student = Student.find(params[:id])
    if teacher_signed_in?
      rooms = current_teacher.rooms
      @student_ids = []
      rooms.each do |r|
        @student_ids << r.student_id
      end
      @following = current_teacher.already_following?(@student)
      @followed = current_teacher.already_followed?(@student)
    end
  end
end
