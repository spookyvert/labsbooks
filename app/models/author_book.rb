class AuthorBook < ApplicationRecord
  belongs_to :author
  belongs_to :book
#validate author with book, a book cant have more than one author
end
