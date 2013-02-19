class AlertMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.alert_mailer.changed_bio.subject
  #

  def premailer(message)
    message.text_part.body = Premailer.new(message.text_part.body.to_s, with_html_string: true).to_plain_text
    message.html_part.body = Premailer.new(message.html_part.body.to_s, with_html_string: true).to_inline_css
    return message
  end

  def changed_bio(email, old_bio)
    @oldbio = old_bio
    @email = email

    message = mail to: email, subject: "You've changed your bio!"
  end
end
