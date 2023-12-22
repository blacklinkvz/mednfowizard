class ArticlesMedicamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_articles_medicament, only: %i[ show edit update destroy ]

  # GET /articles_medicaments or /articles_medicaments.json
  def index
    @medicaments = Medicament.all
    @articles_medicaments = ArticlesMedicament.all
    @articles = Article.where(user_id: current_user.id)
  end

  # GET /articles_medicaments/1 or /articles_medicaments/1.json
  def show
    @articles_medicaments = ArticlesMedicament.all
  end

  # GET /articles_medicaments/new
  def new
    @articles_medicament = ArticlesMedicament.new
    @articles = Article.where(user_id: current_user.id)
    @medicaments = Medicament.all
  end

  # GET /articles_medicaments/1/edit
  def edit
    @articles = Article.where(user_id: current_user.id)
  end

  # POST /articles_medicaments or /articles_medicaments.json
  def create
    @articles_medicament = ArticlesMedicament.new(articles_medicament_params)
    @medicaments = Medicament.all
    @articles = Article.where(user_id: current_user.id)

    respond_to do |format|
      if @articles_medicament.save
        format.html { redirect_to articles_medicaments_path, notice: "Articles medicament was successfully created." }
        format.json { render :show, status: :created, location: @articles_medicament }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @articles_medicament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles_medicaments/1 or /articles_medicaments/1.json
  def update
    respond_to do |format|
      if @articles_medicament.update(articles_medicament_params)
        format.html { redirect_to articles_medicament_path, notice: "Articles medicament was successfully updated." }
        format.json { render :show, status: :ok, location: @articles_medicament }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @articles_medicament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles_medicaments/1 or /articles_medicaments/1.json
  def destroy
    @articles_medicament.destroy!

    respond_to do |format|
      format.html { redirect_to articles_medicaments_url, notice: "Articles medicament was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articles_medicament
      @articles_medicament = ArticlesMedicament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def articles_medicament_params
      params.require(:articles_medicament).permit(:article_id, :medicament_id, :quantity)
    end

    def authenticate_user!
      redirect_to new_user_session_path, alert: "Tienes que registrarte o ingresar para continuar" unless user_signed_in?
    end
end
