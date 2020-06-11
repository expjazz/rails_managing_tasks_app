module ProjectsHelper
  def total_project_time(project)
    total = 0
    project.groups.includes([:tasks]).each do |group|
      group.tasks.each { |task| total += task.amount }
    end
    total
  end

  def group_all
    Group.create(name: 'None', icon: '', user: User.first) unless Group.find_by(name: 'None')
    Group.all
  end

  def no_project(list)
    render 'projects/noproject' if list.empty? || list.size == 1
  end
end
