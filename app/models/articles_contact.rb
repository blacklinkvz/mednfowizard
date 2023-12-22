class ArticlesContact < ApplicationRecord
  belongs_to :article
  belongs_to :contact
end
