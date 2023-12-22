class DestiniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_destiny, only: %i[ show edit update destroy ]

  # GET /destinies or /destinies.json
  def index
    @destinies = Destiny.all
    @countries = Country.all
  end

  # GET /destinies/1 or /destinies/1.json
  def show
  end

  # GET /destinies/new
  def new
    @destiny = Destiny.new
    @countries = Country.all
  end

  # GET /destinies/1/edit
  def edit
    @destiny = Destiny.find(params[:id])
    @country = Country.find_by(id: @destiny.country_id)
    @travel = Travel.find_by(id: @destiny.travel_id)
  end

  # POST /destinies or /destinies.json
  def create
    @countries = Country.all
    @travel = Travel.where(user_id: current_user.id)
    @destiny = Destiny.new(destiny_params)
  
    respond_to do |format|
      if @destiny.save
        format.html { redirect_to new_article_path, notice: "Destino creado exitosamente." }
        format.json { render :show, status: :created, location: @destiny }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @destiny.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /destinies/1 or /destinies/1.json
  def update
    respond_to do |format|
      if @destiny.update(destiny_params)
        format.html { redirect_to destiny_url(@destiny), notice: "Destiny was successfully updated." }
        format.json { render :show, status: :ok, location: @destiny }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @destiny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinies/1 or /destinies/1.json
  def destroy
    @destiny.destroy!

    respond_to do |format|
      format.html { redirect_to destinies_url, notice: "Destiny was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destiny
      @destiny = Destiny.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def destiny_params
      params.require(:destiny).permit(:start_date, :fishis_date, :country_id, :travel_id)
    end

    def authenticate_user!
      redirect_to new_user_session_path, alert: "Tienes que registrarte o ingresar para continuar" unless user_signed_in?
    end

end
