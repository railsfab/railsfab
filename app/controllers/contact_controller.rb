class ContactController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.valid?
            @contact.save()
            begin
                UserMailer.contactus(@contact).deliver()
            rescue Exception => e
                puts e
                puts "Error sending email: contactus"
            end
            redirect_to root_url
        else
            render :new
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :company, :message)
    end
end
