FactoryGirl.define do

  factory :merchant do
    sequence :name do |n|
      "Merchant ##{n}"
    end
  end

  factory :item do
    sequence :name do |n|
      "Item ##{n}"
    end

    description "This is an item."

    sequence :unit_price do |n|
      n * rand(5)
    end

    merchant
  end


  factory :customer do
    sequence :first_name do |n|
      "John #{n}"
    end
    sequence :last_name do |n|
      "Padrinowski #{n}"
    end
  end

  factory :invoice do
    customer
    merchant
    status "shipped"
  end

  factory :transaction do
    invoice
    sequence :credit_card_number do |n|
      n
    end
    sequence :credit_card_expiration_date do |n|
      "date: #{n}"
    end
    result "success"
  end


  factory :invoice_item do
    item
    invoice
    quantity 3
    sequence :unit_price do |n|
      n * 123
    end
  end


end
