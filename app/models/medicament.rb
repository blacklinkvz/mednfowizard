class Medicament < ApplicationRecord
  belongs_to :unit
  has_many :articles, through: :articles_medicaments
end
