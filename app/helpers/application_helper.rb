module ApplicationHelper
  def tos_global_id(arr)
    arr[1].to_global_id
  end

  def user_signed_in
    render 'layouts/signedin' if user_signed_in?
  end

  def user_not_signed_in
    render 'layouts/notsignedin' unless user_signed_in?
  end

  def total_time_tasks(user, external = false)
    arr = []

    if external == true
      user.external_tasks(user.tasks).each { |t| arr << t.amount }
    else
      user.tasks.each { |t| arr << t.amount }
    end
    arr.sum
  end

  def group_icon(task)
    if task.group.nil?
      ''
    else
      fa_icon task.group.icon, class: 'd-flex mr-3 f-s-5'
    end
  end

  def chose_group_icon(icon)
    fa_icon icon, class: 'f-s-3'
  end

  def layout_header
    render 'layouts/header' unless request.url.include?('users' + '/' + current_user.id.to_s)
  end
end
