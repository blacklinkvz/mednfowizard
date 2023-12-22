class Travel < ApplicationRecord
  belongs_to :user
  has_many :destinies, dependent: :destroy, inverse_of: :travel
  has_one :article, dependent: :destroy, inverse_of: :travel
end
