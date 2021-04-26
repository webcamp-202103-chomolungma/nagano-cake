class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable ,:validatable
          
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code,
            :address, :phone_number, presence: true
  has_many :addresses

  def active_for_authentication?
  # 最初はis_deletedで退会。
  # !でdefaultをtrueに逆にできる
    super && !self.is_deleted

  end
  
  # # is_deletedがfalseならtrueを返すようにしている
  # def active_for_authentication?
  #   super && (is_deleted == false)
  # end
end
