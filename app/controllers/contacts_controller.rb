class ContactsController < ApplicationController
  def index
    @contacts = Contact.fetch_all
    p 3333333
    p  @contacts
  end

  def new
  end

  def create
    @contact = Contact.create_contact(params)
    redirect_to contacts_path
  end
end
