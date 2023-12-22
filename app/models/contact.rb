class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :country
  has_many :articles, through: :articles_contacts
end
