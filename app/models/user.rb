class User < ApplicationRecord

  has_many :items


  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  validates :nickname,                 presence:true
  validates :password,                 format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze }
  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :birthday
  end
end
