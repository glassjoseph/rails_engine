FactoryGirl.define do

  factory :merchant do
    sequence :name do |n|
      "Merchant ##{n}"
    end
  end

  factory :item do
    sequence :name do |n|
      "Item # #{n}"
    end

    description "This is an item."

    sequence :unit_price do |n|
      n * rand(5)
    end

    merchant
  end


end
