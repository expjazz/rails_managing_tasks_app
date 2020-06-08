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

  def total_project_time(project)
    total = 0
    project.groups.each do |group|
      group.tasks.each { |task| total += task.amount }
    end
    total
  end

  def total_group_time(group)
    total = 0
    group.tasks.each { |task| total += task.amount }
    total
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

  def user_image(user)
    if user.image.attached?
      image_tag user.image, class: 'user-show-image text-center mt-5'
    else
      ''
    end
  end

  def user_image_small(user)
    if user.image.attached?
      image_tag user.image, class: 'user-show-small text-center mr-3 d-flex'
    else
      ''
    end
  end

  def manage_employee(user)
    if user.profile_type == 'Manager'
      render 'users/manager'
    else
      ''
    end
  end

  def working_period(user)
    hiring_date = (Time.now - user.created_at).to_s.to_i
    user.format_duration(hiring_date)
  end

  def hidden_user(user)
    if user != current_user
      render 'tasks/taskemp'
    elsif user == current_user
      render 'tasks/taskuser'
    end
  end

  def assigned_tasks(user)
    temp = check_tasks_to_do(current_user) if current_user.profile_type == 'Employee' && user == current_user
    if temp == true
      future_tasks = user.tasks.select { |x| x.status == false }
      @future_count = future_tasks.count
      render 'tasks/assignedtasks'
    elsif current_user.profile_type == 'Manager' && current_user != user
      render 'tasks/manager'
    end
  end

  def group_all
    Group.create(name: 'None', icon: '', user: current_user) unless Group.find_by(name: 'None')
    Group.all
  end

  def project_all
    Project.create(name: 'None', user: current_user) unless Project.find_by(name: 'None')
    Project.all
  end

  def check_tasks_to_do(user)
    temp = false
    user.tasks.each do |item|
      next unless item.status == false

      temp = true
      break
    end
    return true if temp == true
    return false if temp == false
  end

  def layout_header
    render 'layouts/header' unless request.url.include?('users' + '/' + current_user.id.to_s)
  end
end
