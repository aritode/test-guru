class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactsMailer.contact_email(@contact).deliver_now
      redirect_to new_contact_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end

end
