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
end
