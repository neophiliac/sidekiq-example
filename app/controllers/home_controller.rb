class HomeController < ApplicationController
  def index
  end

  def create
    # send email to params['addr']
    @mail = Notification.too_fast({:addr => email_addr_param})
  end
end
