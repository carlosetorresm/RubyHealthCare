class ConsultsController < ApplicationController
  before_action :set_consult, only: [:show, :edit, :update, :destroy]

  # GET /consults
  # GET /consults.json
  def index
    if doctor_signed_in?
      @consults = Consult.paginate(page: params[:page], per_page:5).where(speciality: current_doctor.speciality_id, doctor: 1).abierta
    else 
      if patient_signed_in?
        @consults = Consult.where(patient: current_patient).norespondida
      else
        redirect_to root_path
      end
    end
  end

  # GET /consults/1
  # GET /consults/1.json
  def show
    @answer = Answer.new
    @consult = Consult.find(params[:id])
    if doctor_signed_in?
      if @consult.doctor == Doctor.first
        @consult.doctor = current_doctor
        @consult.save
      else
        if @consult.doctor != current_doctor
          redirect_to root_path
        end
      end
    end
  end

  # GET /consults/new
  def new
    if current_patient
      @consult = Consult.new
    else
      redirect_to root_path
    end
  end

  # GET /consults/1/edit
  def edit
    if !current_patient
      redirect_to root_path
    end
  end

  # POST /consults
  # POST /consults.json
  def create
    @consult = Consult.new(consult_params)

    respond_to do |format|
      if @consult.save
        format.html { redirect_to @consult, notice: 'Consult was successfully created.' }
        format.json { render :show, status: :created, location: @consult }
      else
        format.html { render :new }
        format.json { render json: @consult.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consults/1
  # PATCH/PUT /consults/1.json
  def update
    respond_to do |format|
      if @consult.update(consult_params)
        format.html { redirect_to @consult, notice: 'Consult was successfully updated.' }
        format.json { render :show, status: :ok, location: @consult }
      else
        format.html { render :edit }
        format.json { render json: @consult.errors, status: :unprocessable_entity }
      end
    end
  end

  def redirigir
  end

  def mandar
    @consult = Consult.find(params[:consult_id])
    if @consult.update(udp_params)
    redirect_to consults_path
    else
      redirect_to root_path
    end
  end

  # DELETE /consults/1
  # DELETE /consults/1.json
  def destroy
    @answer=Answer.where(consult_id: @consult.id)
    @answer.each do |answer|
      answer.destroy
    end
    @consult.destroy
    respond_to do |format|
      format.html { redirect_to consults_url, notice: 'Consult was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consult
      @consult = Consult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consult_params
          params.require(:consult).permit(:closed, :subject, :speciality_id, :symptoms, adj: []).merge(answered: 0, patient_id: current_patient.id, doctor_id: Doctor.first.id)
    end
    #Manda la consulta a otro medico
    def udp_params
        params.require(:consult).permit(:doctor_id).merge(closed: 0, answered: 0, updated_at: Time.now)
    end
end
