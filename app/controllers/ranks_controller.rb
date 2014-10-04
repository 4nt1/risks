class RanksController < ApplicationController
  before_action :set_rank, only: [:show, :edit, :update, :destroy]

  def index
    @ranks = Rank.all
    if params[:risk_ids]
      @ranks = @ranks.all_in(risk_ids: params[:risk_ids])
    end
    if params[:type_ids]
      @ranks = @ranks.all_in(type_ids: params[:type_ids])
    end
  end

  def show
  end

  def new
    @rank = Rank.new
  end

  def edit
  end

  def create
    @rank = Rank.new(rank_params)

    if @rank.save
      flash[:success] = 'Le rang a bien été créé'
      redirect_to ranks_path
    else
      flash[:danger] = "Une erreur est survenue: #{@rank.errors.full_messages}"
      render :new
    end
  end

  def update
    if @rank.update(rank_params)
      flash[:success] = 'Le rang a bien été mis à jour'
      redirect_to ranks_path
    else
      flash[:danger] = "Une erreur est survenue: #{@rank.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @rank.destroy
    flash[:success] = 'Le rang a bien été supprimé'
    redirect_to ranks_url
  end

  private
    def set_rank
      @rank = Rank.find(params[:id])
    end

    def rank_params
      params.require(:rank).permit(:code, :description, :libelle, :type_ids => [], :risk_ids => [])
    end
end
