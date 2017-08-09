class SleepLogsController < ApplicationController
  def new
    @sleep_log = SleepLog.new()
  end

  def create
    @sleep_log = current_user.sleep_logs.new(sleep_log_params)
    if @sleep_log.save
      flash[:notice] = "Sleep Log was saved"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "There was a problem saving your Sleep Log"
    end
  end

private
  def sleep_log_params
    params.require(:sleep_log).permit(:bed_time, :time_to_sleep, :times_woken_up, :length_of_awakening, :time_woken_up_for_good, :rest_level)
  end
end
