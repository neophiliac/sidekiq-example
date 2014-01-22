class Notifications < ActionMailer::Base
  default from: "from@example.com"

  def too_fast(email)
    @greeting = "Hi"

    mail to: email
  end

  def too_slow(email)
    @greeting = "um, what was I going to say? Oh yeah, Hi"

    sleep 1 # pretend to execute a long query
    mail to: email
  end
end
