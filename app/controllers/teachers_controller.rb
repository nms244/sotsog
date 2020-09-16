class TeachersController < ApplicationController

  before_action :authenticate_teacher!, except: [:show]

  def index
    @teacher = current_teacher
    if params[:search] == nil
      @students = Student.all
    elsif params[:search] == ''
      @students = Student.all
    else
      split_keyword = params[:search].split(/[[:blank:]]+/)
      @students = []
      split_keyword.each do |sk|
        next if sk == ""
        @students += Student.where('name like(?) or profile like(?)', "%#{sk}%","%#{sk}%")
      end
      @students.uniq!
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    if student_signed_in?
      rooms = current_student.rooms
      @teacher_ids = []
      rooms.each do |r|
        @teacher_ids << r.teacher_id
      end
      @following = current_student.already_following?(@teacher)
      @followed = current_student.already_followed?(@teacher)
    end
  end
end
