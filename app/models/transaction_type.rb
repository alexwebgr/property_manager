class TransactionType < ApplicationRecord
  validates :label, presence: true
  before_create :generate_handle

  def generate_handle
    self.handle = label.downcase.gsub(/[^a-z]/, '')
  end
end
