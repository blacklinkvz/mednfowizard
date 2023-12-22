# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
    @user = User.new
    @bloodtypes = Bloodtype.all
		@countries = Country.all
  #   super
   end

  # POST /resource
   def create
    @user = User.new(user_params)
    @bloodtypes = Bloodtype.all
		@countries = Country.all

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "Usuario creado exitosamente." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  #   super
   end

  def user_params
    params[:user][:usertype_id] ||= 1
    params.require(:user).permit(:name, :s_name, :lastname, :s_lastname, :rut, :passport, :email, :password, :country_id, :bloodtype_id, :usertype_id)
  end
end
