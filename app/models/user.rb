class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :passports, dependent: :destroy
  has_many :certificats, dependent: :destroy

  validates :first_name, :last_name, :phone, :need, :budget, :city, :indicatif, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
