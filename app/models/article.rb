class Article < ApplicationRecord
  belongs_to :user
  belongs_to :travel

  
  has_many :articles_medicaments, dependent: :destroy #Borrar en cascada
  has_many :medicaments, through: :articles_medicaments, dependent: :destroy

  has_many :diseases, through: :articles_diseases, dependent: :destroy
  has_many :articles_diseases, dependent: :destroy #Borrar en cascada
  
  
  has_many :articles_contacts, dependent: :destroy #Borrar en cascada
  has_many :contacts, through: :articles_contacts, dependent: :destroy
  
  has_and_belongs_to_many :diseases

  validates :travel_id, uniqueness: true

  has_one_attached :qrcode, dependent: :destroy #Borrar en cascada
  before_commit :generate_qrcode, on: :create, dependent: :destroy

  private

  require "rqrcode"


  def generate_qrcode
    #Buscamos el host
    host = Rails.application.config.action_controller.default_url_options[:host]
    qrcode = RQRCode::QRCode.new("http://#{host}/articles/#{id}?key=#{key}")
    #Generamos el QR
    
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 240
    )
    
    self.qrcode.attach(
      io: StringIO.new(png.to_s),
      filename: "qrcode.png",
      content_type: "image/png"
    )


  end

end
