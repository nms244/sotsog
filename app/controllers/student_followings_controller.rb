class StudentFollowingsController < ApplicationController

  before_action :authenticate_student!, except: [:show]

  def show
    @teachers = Teacher.all
    rooms = current_student.rooms
    @teacher_ids = []
    rooms.each do |r|
      @teacher_ids << r.teacher_id
    end
  end

  def create
    @teacher = Teacher.find(params[:followed_id])
    following = current_student.follow(@teacher)
    if following.save
      flash[:success] = '先生をフォローしました'
      redirect_to @teacher
    else
      flash.now[:alert] = '先生のフォローに失敗しました'
      redirect_to @teacher
    end
  end

  def destroy
    @teacher = Teacher.find(params[:followed_id])
    following = current_student.unfollow(@teacher)
    if following.destroy
      flash[:success] = '先生のフォローを解除しました'
      redirect_to @teacher
    else
      flash.now[:alert] = '先生のフォロー解除に失敗しました'
      redirect_to @teacher
    end
  end

  private

end
