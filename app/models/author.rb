class Author < ApplicationRecord
  validates_presence_of :name

  has_many :book_authors
  has_many :books, through: :book_authors

  def average_pages
    total_pages = books.map {|book| book.page_count}
    average = total_pages.sum / books.length
    average
  end
end
