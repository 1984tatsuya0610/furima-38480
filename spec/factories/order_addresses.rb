FactoryBot.define do
  factory :order_address do

    postal_code       {"123-1234"}
    sender_id         {"2"}
    municipality      {"市町村"}
    house_number      {"1-1"}
    building_name     {"建物名"}
    phone_number      {"0312345678"}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
