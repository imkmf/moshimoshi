class MailPreview < MailView

  def changed_bio
    user = Struct.new(:email, :name).new('name@example.com', 'Jill Smith')
    mail = AlertMailer.changed_bio(user.email, "I'm a foobar, foo-ing the stuff.")
  end
end