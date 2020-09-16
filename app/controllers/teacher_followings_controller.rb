class TeacherFollowingsController < ApplicationController

  before_action :authenticate_teacher!, except: [:show]

  def show
    @students = Student.all
    rooms = current_teacher.rooms
    @student_ids = []
    rooms.each do |r|
      @student_ids << r.student_id
    end
  end

  def create
    @student = Student.find(params[:followed_id])
    following = current_teacher.follow(@student)
    if following.save
      flash[:success] = '生徒をフォローしました'
      redirect_to @student
    else
      flash.now[:alert] = '生徒のフォローに失敗しました'
      redirect_to @student
    end
  end

  def destroy
    @student = Student.find(params[:followed_id])
    following = current_teacher.unfollow(@student)
    if following.destroy
      flash[:success] = '生徒のフォローを解除しました'
      redirect_to @student
    else
      flash.now[:alert] = '生徒のフォロー解除に失敗しました'
      redirect_to @student
    end
  end

  private

end
