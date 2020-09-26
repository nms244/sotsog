module ApplicationHelper
  def user_icon(user)
    if user.icon?
      image_tag user.icon_url, class: 'icon'
    else
      image_tag('default.jpeg', class: 'icon')
    end
  end

  def navigation_bar
    if student_signed_in?
      render 'students/nav'
    elsif teacher_signed_in?
      render 'teachers/nav'
    end
  end
end
