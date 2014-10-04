class RisksController < ApplicationController
  before_action :set_risk, only: [:edit, :update, :destroy]

  def index
    @risks = Risk.all
  end

  def edit

  end

  def create
    @risk = Risk.new(risk_params)

    respond_to do |format|
      if @risk.save
        format.js
      else
        format.js { render :create_error}
      end
    end
  end

  def update
    respond_to do |format|
      if @risk.update(risk_params)
        format.html { redirect_to @risk, notice: 'Risk was successfully updated.' }
        format.json { render :show, status: :ok, location: @risk }
      else
        format.html { render :edit }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @risk.destroy
    respond_to do |format|
      format.html { redirect_to risks_url, notice: 'Risk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_risk
      @risk = Risk.find(params[:id])
    end

    def risk_params
      params.require(:risk).permit(:code, :description, :libelle)
    end
end
