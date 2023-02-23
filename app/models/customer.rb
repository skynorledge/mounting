class Customer < ApplicationRecord

  has_many :cart_items, dependent: :destroy

  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def active_for_authentication?
    super && (is_deleted == false)
   end



end
