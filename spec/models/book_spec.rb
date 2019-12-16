require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :page_count}
    it {should validate_presence_of :publication_year}
  end

  describe "relationships" do
    it {should have_many(:authors).through(:book_authors)}
  end

  describe "methods" do
    it "can return the average number of pages of the authors books" do
      author_1 = Author.create!(name: "James S.A. Corey")
      book_1 = author_1.books.create!(title: "Leviathan Wakes", page_count: 464, publication_year: 2014)
      book_3 = author_1.books.create(title: "Caliban's War", page_count: 482, publication_year: 2017)

      expect(author_1.average_pages).to eq(473)
    end
  end
end
