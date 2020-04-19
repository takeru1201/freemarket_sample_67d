class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true
  has_many :items
  has_many :comments
  has_many :likes
  has_many :items_statuses
  has_one :credit_card
  has_one :address
  accepts_nested_attributes_for :address

  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい'}
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい'}
  validates :last_name, presence: true, length: { maximum: 35 }, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '日本語でお願いします please use Japanese characters'}
  validates :first_name, presence: true, length: { maximum: 35 }, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '日本語でお願いします please use Japanese characters'}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'のフォーマットが不適切です'}
  validates :phone_number, presence: true, length: { in: 10..12  }, format: { with: /\A\d{10,11}\z/, message: '10-11桁でハイフン（-）を入れないで下さい'}
  validates :password, presence: true, length: { in: 7..128 }, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i, message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :password_confirmation, presence: true, length: { in: 7..128 }, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i, message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :birthday, presence: true, format: { with: /\A(19[0-9]{2}|20[0-9]{2})\/([1-9])|(0[0-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])\z/, message: 'は年/月/日で入力して下さい 例 1999/02/31 2001/6/30'}

end
