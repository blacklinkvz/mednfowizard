class Country < ApplicationRecord
  belongs_to :language
  has_many :destinies
  has_many :users
end
