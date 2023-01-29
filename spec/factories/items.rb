FactoryBot.define do
  factory :item do
    association :user

    name                     {"商品名"}
    introduction             {"商品の説明"}
    price                    {"1000"}
    item_condition_id        {"2"}
    preparation_day_id       {"2"}
    postage_type_id          {"2"}
    category_id              {"2"}
    sender_id                {"2"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
