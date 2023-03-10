class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,         presence: true
  validates :first_name_kana,  presence: true,format: { with: /\A[\p{katakana}  ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
  validates :family_name_kana, presence: true,format: { with: /\A[\p{katakana}  ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
  validates :date_of_birth,    presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と半角数字の両方を含めて設定してください' 
  has_many :items
  has_many :orders
end
