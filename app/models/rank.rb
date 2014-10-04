class Rank
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code,        type: String
  field :description, type: String
  field :libelle,     type: String

  has_and_belongs_to_many :types
  has_and_belongs_to_many :risks

  before_save do |this|
    this.libelle =  "#{this.code} - #{this.description}"
  end

end
