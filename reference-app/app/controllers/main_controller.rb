class MainController < ActionController::Base
  respond_to :html

  def index
    contacts = Contact.all
    @contacts = contacts.active_model_serializer.new(contacts)
  end
end
