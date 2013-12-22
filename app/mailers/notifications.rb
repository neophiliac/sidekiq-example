class Notifications < ActionMailer::Base
  default from: "from@example.com"

  def too_fast
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def too_slow
    @greeting = "um, what was I going to say? Oh yeah, Hi"

    sleep 10 # pretend to execute a long query
    mail to: "to@example.org"
  end
end
