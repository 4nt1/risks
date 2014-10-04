class  SearchController < ApplicationController
  autocomplete :type, :code,        full: true, display_value: :libelle
  autocomplete :type, :description, full: true, display_value: :libelle
  autocomplete :risk, :code,        full: true, display_value: :libelle
  autocomplete :risk, :description, full: true, display_value: :libelle

  def index
    @risk = Risk.new
    @type = Type.new

  end
end