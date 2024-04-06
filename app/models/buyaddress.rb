class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code , :prefectures_id, :municipaloties, :street_address, :building_name, :telephone,:buy_id

  with_options presence: true do
    validates :item_id
    validates :user_id

    validates :post_code
    validates :municipaloties, presence: true
    validates :street_address, presence: true
    validates :telephone, presence: true

  end

  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }


  def save
    # 寄付情報を保存し、変数donationに代入する
    buy = Buy.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code, prefectures_id: prefectures_id, municipaloties: municipaloties, street_address: street_address, building_name: building_name, telephone: telephone, :buy_id buy.id)
  end

end