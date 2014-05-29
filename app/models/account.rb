class Account < ActiveRecord::Base
  has_many :domains, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
