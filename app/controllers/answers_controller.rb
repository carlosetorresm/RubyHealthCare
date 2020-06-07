class AnswersController < ApplicationController
  before_action :set_answer, only: [:update, :destroy]
  before_action :set_consult

  # POST /answers
  # POST /answers.json
  def create
    @answer = current_doctor.answers.new(answer_params)
    @answer.consult = @consult
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.consult, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer.consult }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer.consult, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer.consult }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consult
      @consult = Consult.find(params[:consult_id])
    end
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:consult_id, :doctor_id, :body)
    end
end
