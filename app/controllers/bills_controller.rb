class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # GET /bills
  # GET /bills.json
  def index
    if doctor_signed_in?
      @bills = Bill.paginate(page: params[:page], per_page:5).where(doctor: current_doctor).ultimos
    else
      redirect_to root_path
    end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    if !doctor_signed_in?
      redirect_to root_path
    end
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'bills/factura', pdf:'Factura', layout: 'pdf.html'}
    end
  end

  # GET /bills/new
  def new
    if doctor_signed_in?
      @bill = Bill.new
    else
      redirect_to root_path
    end
  end

  # GET /bills/1/edit
  def edit
    if !doctor_signed_in?
      redirect_to root_path
    end
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:patient_id, :body, :total).merge(doctor_id: current_doctor.id)
    end
end
