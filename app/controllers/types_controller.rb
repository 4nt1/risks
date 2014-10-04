class TypesController < ApplicationController
  before_action :set_type, only: [:edit, :update, :destroy]

  def index
    @types = Type.all
  end

  def edit

  end

  def create
    @type = Type.new(type_params)

    respond_to do |format|
      if @type.save
        format.js
      else
        format.js { render :create_error}
      end
    end
  end

  def update
    respond_to do |format|
      if @type.update(type_params)
        format.html { redirect_to @type, notice: 'Type was successfully updated.' }
        format.json { render :show, status: :ok, location: @type }
      else
        format.html { render :edit }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @type.destroy
    respond_to do |format|
      format.html { redirect_to types_url, notice: 'Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:code, :description, :libelle)
    end
end
