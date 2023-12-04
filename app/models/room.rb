class Room < ApplicationRecord
  before_create :set_token
  validates :name, presence: true, uniqueness: true

  has_many :members

  def to_param
    token
  end

  private

  def set_token
    self.token = SecureRandom.alphanumeric(8)
  end
end