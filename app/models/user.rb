class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..40

  validates :nickname, :email, :birth_day, presence: true



  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }  do
    validates :first_name
    validates :last_name
  end



  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
     validates :first_kana
     validates :last_kana

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX
  end

  has_many :items

end
