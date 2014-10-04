class Type
  include Mongoid::Document
  include Mongoid::Timestamps
  field :code,          type: String
  field :description,   type: String
  field :libelle,       type: String

  validates_uniqueness_of :code
  validates_presence_of   :code, :description

  has_and_belongs_to_many :ranks

  before_save do |this|
    this.libelle =  "#{this.code} - #{this.description}"
  end
end
