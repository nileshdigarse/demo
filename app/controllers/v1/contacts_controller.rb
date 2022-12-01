class V1::ContactsController < ApplicationController
	def index
		@contacts = Contact.all 
		render json: @contacts, status: :ok
	end

	def show 
    @contact = Contact.find(params[:id])
    render json: @contact, status: :ok
  end

	def create 
		@contact = Contact.new(contact_params)
		if @contact.save
			MailerJob.perform_now(@contact)
			render json: @contact, status: :created
		end
	end

	def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
    	render json: @contact, status: :ok
    else
    	head(:issue_occurs)
    end
  end

	def destroy
		@contact = Contact.find(params[:id])
		if @contact.destroy
			head(:ok)
		else
			head(:issue_occurs)
		end
	end

	private 

	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :email)
	end
end
