class Transaction < ApplicationRecord
  belongs_to :invoice

  enum result: %w(failure success)
end
