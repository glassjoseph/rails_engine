FactoryGirl.define do

  factory :merchant do
    sequence :name do |n|
      "Merchant ##{n}"
    end

    factory :merchant_with_invoices, class: Merchant do

      transient do
        invoices_count 4
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice, evaluator.invoices_count, merchant: merchant)
      end
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
    sequence :credit_card_number do |n|
      n
    end
    invoice
    sequence :credit_card_expiration_date do |n|
      "date: #{n}"
    end
    result "success"
  end


  factory :invoice_item do
    item
    invoice
    quantity 3
    unit_price 400
  end
end
