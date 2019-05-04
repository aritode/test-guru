# Preview all emails at http://localhost:3000/rails/mailers/contacts_mailer
class ContactsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contacts_mailer/contact_email
  def contact_email
    contact = Contact.first

    ContactsMailer.contact_email(contact)
  end

end
