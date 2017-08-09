class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, :presence => true
  has_many :sleep_logs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def weekly_averages
    sum = {}
    logs = self.sleep_logs.where(created_at: 1.week.ago.to_time..Time.now)
    if logs.length > 0
      column_names = SleepLog.column_names
      puts "here"
      ["id", "user_id", "created_at", "updated_at"].each do |at|
        column_names.delete(at)
      end
      column_names.each do |col|
        sum[col] = 0
      end
      logs.each do |log|
        column_names.each do |col|
          sum[col] += log[col].to_f
        end
      end
      sum.each do |key, value|
        sum[key] /= logs.length
        if key == "bed_time" || key == "time_woken_up_for_good"
          sum[key] = Time.at(sum[key])
        end
      end
      sum
    end
  end
end
