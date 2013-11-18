class UserMailer < ActionMailer::Base
  default from: ENV["RAILSFAB_DEFAULT_FROM"]

  def contactus(contact)
      @contact = contact
      mail(to: ENV["RAILSFAB_ADMINS"], subject: "#{@contact.name} contacted you from webform")
  end
end
