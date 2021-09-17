class UserdatsController < ApplicationController
  before_action :set_userdat, only: %i[ show edit update destroy ]

  # GET /userdats or /userdats.json
  def index
    @userdats = Userdat.all
  end

  # GET /userdats/1 or /userdats/1.json
  def show
  end

  # GET /userdats/new
  def new
    @userdat = Userdat.new
  end

  # GET /userdats/1/edit
  def edit
  end

  # POST /userdats or /userdats.json
  def create
    @userdat = Userdat.new(userdat_params)

    respond_to do |format|
      if @userdat.save
        format.html { redirect_to @userdat, notice: "Userdat was successfully created." }
        format.json { render :show, status: :created, location: @userdat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userdat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userdats/1 or /userdats/1.json
  def update
    respond_to do |format|
      if @userdat.update(userdat_params)
        format.html { redirect_to @userdat, notice: "Userdat was successfully updated." }
        format.json { render :show, status: :ok, location: @userdat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userdat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userdats/1 or /userdats/1.json
  def destroy
    @userdat.destroy
    respond_to do |format|
      format.html { redirect_to userdats_url, notice: "Userdat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userdat
      @userdat = Userdat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userdat_params
      params.require(:userdat).permit(:fullname, :dob, :vaccination, :gender, :bloodgroup)
    end
end
