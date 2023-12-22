class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :country
  belongs_to :bloodtype
  has_many :contact
  has_many :articles

  validates :rut, presence: true, uniqueness: true, length: { maximum: 10 },
	format: {
		with: /^\d\.\d\d*\-(\d|k|K)$|\d{1,9}\-(\d|k|K)$/,
		multiline: true,
		message: :invalid
	}

  validates :email, presence: true, uniqueness: true,
  format: {
      with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
      message: :invalid
  }

  validates :passport, uniqueness: true, presence: true, length: { minimum: 6 }
end
