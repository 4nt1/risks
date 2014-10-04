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
    puts "send back #{@ranks.count} ranks"
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

    respond_to do |format|
      if @rank.save
        format.html { redirect_to @rank, notice: 'Rank was successfully created.' }
        format.json { render :show, status: :created, location: @rank }
      else
        format.html { render :new }
        format.json { render json: @rank.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rank.update(rank_params)
        format.html { redirect_to @rank, notice: 'Rank was successfully updated.' }
        format.json { render :show, status: :ok, location: @rank }
      else
        format.html { render :edit }
        format.json { render json: @rank.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rank.destroy
    respond_to do |format|
      format.html { redirect_to ranks_url, notice: 'Rank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_rank
      @rank = Rank.find(params[:id])
    end

    def rank_params
      params.require(:rank).permit(:code, :description, :libelle, :type_ids => [], :risk_ids => [])
    end
end
