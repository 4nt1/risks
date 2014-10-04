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
    if @type.update(type_params)
      flash[:success] = 'Le type de risque a bien été mis à jour'
      redirect_to types_path and return
    else
      flash[:danger] = "Une erreur est survenue: #{@type.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @type.destroy
    flash[:success] = 'Le type de risque a bien été supprimé'
    redirect_to types_url
  end

  private
    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:code, :description, :libelle)
    end
end
