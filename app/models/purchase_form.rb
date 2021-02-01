class PurchaseForm
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal, :prefecture_id, :minicipalities, :residence, :building, :phone

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :minicipalities
    validates :residence
    validates :phone, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Street.create(postal: postal, prefecture_id: prefecture_id, minicipalities: minicipalities, residence: residence,
                  building: building, phone: phone, purchase_record_id: purchase_record.id)
  end
end
