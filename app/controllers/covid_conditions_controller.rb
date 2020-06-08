class CovidConditionsController < ApplicationController
  before_action :set_covid_condition, only: [:show, :edit, :update, :destroy]

  # GET /covid_conditions
  # GET /covid_conditions.json
  def index
    if doctor_signed_in?
      @covid_conditions = CovidCondition.paginate(page: params[:page], per_page:5).all.primeros
    else
      redirect_to root_path
    end
  end

  # GET /covid_conditions/1
  # GET /covid_conditions/1.json
  def show
    if doctor_signed_in?
      redirect_to covid_conditions_path
    else
      redirect_to root_path
    end
  end

  # GET /covid_conditions/new
  def new
    if doctor_signed_in?
      redirect_to covid_conditions_path
    else
      redirect_to root_path
    end
  end

  # GET /covid_conditions/1/edit
  def edit
    if @covid_condition.condition_id == 1
      @covid_condition.condition_id = 2
    else
      if @covid_condition.condition_id == 2
        @covid_condition.condition_id = 3
      else
        @covid_condition.condition_id = 1
      end
    end
    @covid_condition.updated_at = Time.now
    @covid_condition.save
    redirect_to covid_conditions_path
  end

  # POST /covid_conditions
  # POST /covid_conditions.json
  def create
    @covid_condition = CovidCondition.new(covid_condition_params)

    respond_to do |format|
      if @covid_condition.save
        format.html { redirect_to @covid_condition, notice: 'Covid condition was successfully created.' }
        format.json { render :show, status: :created, location: @covid_condition }
      else
        format.html { render :new }
        format.json { render json: @covid_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /covid_conditions/1
  # PATCH/PUT /covid_conditions/1.json
  def update
    respond_to do |format|
      if @covid_condition.update(covid_condition_params)
        format.html { redirect_to @covid_condition, notice: 'Covid condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @covid_condition }
      else
        format.html { render :edit }
        format.json { render json: @covid_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covid_conditions/1
  # DELETE /covid_conditions/1.json
  def destroy
    @covid_condition.destroy
    respond_to do |format|
      format.html { redirect_to covid_conditions_url, notice: 'Covid condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_covid_condition
      @covid_condition = CovidCondition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def covid_condition_params
      params.require(:covid_condition).permit(:patient_id, :condition_id)
    end
end
