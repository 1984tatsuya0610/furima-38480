class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one    :order
  has_one_attached :image

    belongs_to :category
    belongs_to :item_condition
    belongs_to :postage_type
    belongs_to :sender
    belongs_to :preparation_day

    validates :image,              presence: true
    validates :name,               presence: true
    validates :introduction,       presence: true
    validates :price,              presence: true
    with_options presence: true, format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: "can't be blank" }
    end

    validates :category_id,        numericality: { other_than: 1, message: "can't be blank"}
    validates :item_condition_id,  numericality: { other_than: 1, message: "can't be blank"}
    validates :postage_type_id,    numericality: { other_than: 1, message: "can't be blank"}
    validates :sender_id,          numericality: { other_than: 1, message: "can't be blank"}
    validates :preparation_day_id, numericality: { other_than: 1, message: "can't be blank"}
end
