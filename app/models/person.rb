class Person < ApplicationRecord
    validates :first_name, :last_name, :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
    def full_name
      "#{first_name} #{last_name}"
    end
  
    def qr_code
      qrcode = RQRCode::QRCode.new(Rails.application.routes.url_helpers.person_url(self, host: 'localhost', port: 3000))
      qrcode.as_svg(module_size: 6)
    end
  end