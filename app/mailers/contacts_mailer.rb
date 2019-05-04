class ContactsMailer < ApplicationMailer

  default to: %{"TestGuru Project" <testguru-project@yandex.com>}

  def contact_email(contact)
    @name = contact.name
    @email = contact.email
    @body = contact.body

    mail(from: @email)
  end

end
