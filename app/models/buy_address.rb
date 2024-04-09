class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code , :prefectures_id, :municipaloties, :street_address, :building_name, :telephone,:buy_id,:token

  with_options presence: true do
    validates :item_id
    validates :user_id

    validates_format_of :post_code, with: /\A\d{3}-\d{4}\z/
    validates :municipaloties
    validates :street_address
    validates :telephone, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/ }
    validates :token
  end 

  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }


  def save
    # 寄付情報を保存し、変数donationに代入する,なぜユーザーIDが受け取れるのか、ルーティングでitemコントローラーをねすとしないといけない理由。
    buy = Buy.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code, prefectures_id: prefectures_id, municipaloties: municipaloties, street_address: street_address, building_name: building_name, telephone: telephone, buy_id: buy.id)
  end

end