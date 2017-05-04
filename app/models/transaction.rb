class Transaction < ApplicationRecord
  belongs_to :invoice

  scope :successful, -> {where(result: 1)}

  enum result: %w(failure success)
end
