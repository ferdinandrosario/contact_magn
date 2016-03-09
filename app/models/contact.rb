class Contact < ActiveRecord::Base
  has_many :addresses
  has_many :communications
  scope :fetch_all, -> { includes(:addresses,:communications)}

  # helps to create contact,address and communication details if they are shared
  def self.create_contact(params)
    contact = self.create(first_name: params[:contact][:first_name],last_name: params[:contact][:last_name])
    params[:contact][:address] && params[:contact][:address].each do |s|
      contact.addresses.create(add_one:s[1][:address_one],country:s[1][:country])
    end
    params[:contact][:com] && params[:contact][:com].each do |s|
      contact.communications.create(phone:s[1][:phone])
    end
  end

end
