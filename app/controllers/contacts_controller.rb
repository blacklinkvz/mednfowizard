class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.where(user_id: current_user.id)
    @countries = Country.all
  end

  # GET /contacts/1 or /contacts/1.json
  def show
    @countries = Country.all
    if @contact.user_id != current_user.id
      redirect_to root_path, notice: "No tienes acceso a este contacto"
    end
  end

  # GET /contacts/new
  def new
    @countries = Country.all
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @countries = Country.all
  end

  # POST /contacts or /contacts.json
  def create
    @countries = Country.all
    @contact = Contact.new(contact_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @contact.save

        format.html { redirect_to articles_path, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy!

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :lastname, :email, :phone, :user_id, :country_id)
    end

    def authenticate_user!
      redirect_to new_user_session_path, alert: "Tienes que registrarte o ingresar para continuar" unless user_signed_in?
    end
end
