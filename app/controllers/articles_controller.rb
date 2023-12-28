class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.where(user_id: current_user.id)
    @diseases = Disease.all 
  end

  # GET /articles/1 or /articles/1.json
  def show
    #@user = User.where(user_id: current_user.id)
    #@bloodtype = Bloodtype.where(user_id: current_user.id)
    # Validar que la ruta contenga el valor de key
    unless params.require(:key) == @article.key
      render json: { error: "Acceso no autorizado" }, status: 401
    end

  end

  # GET /articles/new
  def new
    @article = Article.new
    @diseases = Disease.all
    @travel = Travel.where(user_id: current_user.id)

  end

  # GET /articles/1/edit
  def edit
    @travel = Travel.all
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params.merge(user_id: current_user.id))
    @travel = Travel.where(user_id: current_user.id)
    @diseases = Disease.all

    # Generar una key aleatoria
    @article.key = SecureRandom.hex(10)

  # Validar que el travel_id no esté ya usado


    respond_to do |format|
      if @article.save
        # Guardar la key en la base de datos
        @article.update_column(:key, @article.key)

        #format.html { redirect_to article_url(@article) + "?key=#{@article.key}", notice: "Article was successfully created." }
        format.html { redirect_to new_articles_disease_path, notice: "Articulo creado exitosamente." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    article_id = @article
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :user_id, :travel_id, :key, :qrcode)
    end
    def authenticate_user!
      redirect_to new_user_session_path, alert: "Tienes que registrarte o ingresar para continuar" unless user_signed_in?
    end
end
