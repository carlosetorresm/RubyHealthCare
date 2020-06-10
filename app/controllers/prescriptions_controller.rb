class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]

  def reenviar
    @prescription = Prescription.find(params[:prescription_id])
    AnswerMailer.new_prescription(@prescription).deliver!
    flash[:notice] = "Receta reenviada."
    redirect_to prescriptions_path
  end

  # GET /prescriptions
  # GET /prescriptions.json
  def index
    if doctor_signed_in?
      @prescriptions = Prescription.paginate(page: params[:page], per_page:5).where(doctor: current_doctor).ultimos
    else
      if patient_signed_in?
        @prescriptions = Prescription.paginate(page: params[:page], per_page:5).where(patient: current_patient).ultimos
      else
        redirect_to root_path
      end
    end
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'prescriptions/receta', pdf:'Receta', layout: 'pdf.html'}
    end
  end

  # GET /prescriptions/new
  def new
    if doctor_signed_in?
      @prescription = Prescription.new
    else
      redirect_to root_path
    end
  end

  # GET /prescriptions/1/edit
  def edit
    if !doctor_signed_in?
      redirect_to root_path
    end
  end

  # POST /prescriptions
  # POST /prescriptions.json
  def create
    @prescription = Prescription.new(prescription_params)

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to @prescription, notice: 'Prescription was successfully created.' }
        format.json { render :show, status: :created, location: @prescription }
      else
        format.html { render :new }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescriptions/1
  # PATCH/PUT /prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to @prescription, notice: 'Prescription was successfully updated.' }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription.destroy
    respond_to do |format|
      format.html { redirect_to prescriptions_url, notice: 'Prescription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescription_params
      params.require(:prescription).permit(:patient_id, :consult_type_id, :subject, :body).merge(doctor_id: current_doctor.id)
    end
end
