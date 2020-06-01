class DService < ApplicationRecord
  belongs_to :service
  belongs_to :doctor
  validates :service, uniqueness: { scope: :doctor }
  validates :price, presence: true, length: { minimum: 3}
end