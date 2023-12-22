class ArticlesContactsController < ApplicationController
  before_action :set_articles_contact, only: %i[ show edit update destroy ]

  # GET /articles_contacts or /articles_contacts.json
  def index
    @articles_contacts = ArticlesContact.all
  end

  # GET /articles_contacts/1 or /articles_contacts/1.json
  def show
  end

  # GET /articles_contacts/new
  def new
    @articles_contact = ArticlesContact.new
    @articles = Article.where(user_id: current_user.id)
    @contacts = Contact.where(user_id: current_user.id)
  end

  # GET /articles_contacts/1/edit
  def edit
    @articles = Article.where(user_id: current_user.id)
    @contacts = Contact.where(user_id: current_user.id)

  end

  # POST /articles_contacts or /articles_contacts.json
  def create
    @articles = Article.where(user_id: current_user.id)
    #@contacts = Contact.where(user_id: current_user.id)
    @articles_contact = ArticlesContact.new(articles_contact_params)

    respond_to do |format|
      if @articles_contact.save
        format.html { redirect_to articles_path, notice: "Articles contact was successfully created." }
        format.json { render :show, status: :created, location: @articles_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @articles_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles_contacts/1 or /articles_contacts/1.json
  def update
    respond_to do |format|
      if @articles_contact.update(articles_contact_params)
        format.html { redirect_to articles_contact_path, notice: "Articles contact was successfully updated." }
        format.json { render :show, status: :ok, location: @articles_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @articles_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles_contacts/1 or /articles_contacts/1.json
  def destroy
    @articles_contact.destroy!

    respond_to do |format|
      format.html { redirect_to articles_contacts_url, notice: "Articles contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articles_contact
      @articles_contact = ArticlesContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def articles_contact_params
      params.require(:articles_contact).permit(:article_id, :contact_id)
    end
end
