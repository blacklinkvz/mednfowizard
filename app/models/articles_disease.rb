class ArticlesDisease < ApplicationRecord
  belongs_to :article
  belongs_to :disease
end
