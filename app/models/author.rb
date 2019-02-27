class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true, uniqueness: true
  validates :birth_year, presence: true

end
