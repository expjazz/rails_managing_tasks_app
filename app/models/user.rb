class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validates :image,
            content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            size:
                      { less_than: 2.megabytes,
                        message:
                      'should be less than 2MB' }
  belongs_to :profile, polymorphic: true
  has_many :tasks
  has_many :groups
  has_many :projects
  has_many :alert_sent, class_name: 'Notice', foreign_key: 'sender_id'
  has_many :alert_received, class_name: 'Notice', foreign_key: 'recipient_id'
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :profile
  has_one_attached :image
  def see_my_tasks(tasks)
    tasks.select { |t| t.user_id == id }
  end

  def external_tasks(tasks)
    tasks.select { |t| t.group.name == 'None' && t.user_id == id } || []
  end

  def format_duration(total)
    if total.zero?
      ''
    else
      duration = {
        year: total / (60 * 60 * 24 * 365),
        day: total / (60 * 60 * 24) % 365,
        hour: total / (60 * 60) % 24,
        minute: total / 60 % 60,
        second: total % 60
      }

      output = []

      duration.each do |key, value|
        if value > 0
          output << "#{value} #{key}"
          output.last << 's' if value != 1
        end
      end

      output.join(', ').gsub(/\,\s(?=\d+\s\w+$)/, ' and ')
    end
  end
end
# def seconds_zero(seconds)
#   return '' if seconds.zero? && !seconds.nil?

#   if seconds < 60
#     return '1 second' if seconds == 1

#     " and #{seconds} seconds"
#   end
# end

# def minutes_zero(seconds)
#   if seconds < 3600 && seconds > 60 && !seconds.nil?
#     minutes = seconds / 60
#     a = '1 minute' if minutes == 1
#     a = "#{minutes} minutes" if minutes > 1
#     seconds -= minutes * 60
#     seconds = format_duration(seconds)
#     seconds = '' if !seconds.nil? && seconds.include?('now')
#     a + seconds
#   end
# end

# def hours_zero(seconds)
#   if seconds < 86_400 && seconds >= 3600 && !seconds.nil?
#     hours = seconds / 3600
#     b = '1 hour' if hours == 1
#     b = "#{hours} hours" if hours > 1
#     seconds -= hours * 60 * 60
#     seconds = format_duration(seconds)
#     seconds = '' if seconds == 'now'
#     return "#{b}, #{seconds}" if seconds != ''
#     return "#{b}, and #{seconds}" if seconds == ''

#     b
#   end
# end

# def days_zero(seconds)
#   if seconds < 31_536_000 && seconds >= 86_400 && !seconds.nil?
#     days = seconds / 86_400
#     c = '1 day' if days == 1
#     c = "#{days} days" if days > 1
#     seconds -= days * 60 * 60 * 24
#     seconds = format_duration(seconds)
#     seconds = '' if seconds == 'now'
#     return "#{c}, #{seconds}" if seconds != ''
#     return "#{c}, and #{seconds}" if seconds == ''

#     c
#   end
# end

# def format_duration(seconds)
#   seconds_zero(seconds)
#   minutes_zero(seconds)
#   hours_zero(seconds)
#   days_zero(seconds)

#   if seconds > 31_536_000
#     years = seconds / 31_536_000
#     d = '1 year' if years == 1
#     d = "#{years} years" if years > 1
#     seconds -= years * 60 * 60 * 24 * 365
#     seconds = format_duration(seconds)
#     seconds = '' if seconds == 'now'
#     return "#{d}, #{seconds}" if seconds != ''
#     return "#{d}, and #{seconds}" if seconds == ''

#     d

#   end
# end
