class Disease < ApplicationRecord
    has_many :articles, through: :articles_diseases
    has_and_belongs_to_many :articles
end
