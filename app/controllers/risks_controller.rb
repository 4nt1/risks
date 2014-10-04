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
    if @risk.update(risk_params)
      flash[:success] = 'Le risque a bien été mis à jour'
      redirect_to risks_path and return
    else
      flash[:danger] = "Une erreur est survenue: #{@risk.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @risk.destroy
    flash[:success] = 'Le risque a bien été supprimé'
    redirect_to risks_url
  end

  private
    def set_risk
      @risk = Risk.find(params[:id])
    end

    def risk_params
      params.require(:risk).permit(:code, :description, :libelle)
    end
end
