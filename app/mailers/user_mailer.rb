class UserMailer < ActionMailer::Base
  default from: "viji.jsm@gmail.com"

  def notify_offer(user)
    mail(:to => user.email, :subject => "New Offer For your item")
  end

  def notify_update(user)
    mail(:to => user.email, :subject => "Update for your request")
  end
end
