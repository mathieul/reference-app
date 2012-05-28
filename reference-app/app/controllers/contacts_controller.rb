class ContactsController < ApplicationController
  def index
    contacts = Contact.scoped
    render json: contacts, root: false
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact, root: false
  end

  def new
    contact = Contact.new
    render json: contact, root: false
  end

  def create
    contact = Contact.new(params[:contact])
    if contact.save
      render json: contact, status: :created, location: contact, root: false
    else
      render json: contact.errors, status: :unprocessable_entity, root: false
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(params[:contact])
      head :no_content
    else
      render json: contact.errors, status: :unprocessable_entity, root: false
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    head :no_content
  end
end
