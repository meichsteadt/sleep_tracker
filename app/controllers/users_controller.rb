class UsersController <  ApplicationController
  def show
    @reported_logs = current_user.weekly_averages
  end
end
