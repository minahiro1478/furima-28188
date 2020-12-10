class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, password_length: 7..40
  
  # has_many :buyer_product, foreign_key: "buyer_id", class_name: "product", dependent: :destroy

  validates :nickname, :email, :birth_day, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
    validates :first_kana
    validates :last_kana

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  end

end