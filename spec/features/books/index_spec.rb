require 'rails_helper'

RSpec.describe "When I visit the books index" do
  before :each do
    @author_1 = Author.create!(name: "James S.A. Corey")
    @author_2 = Author.create!(name: "Some Dude")
    @author_3 = Author.create!(name: "J.R.R. Tolkien")
    @book_1 = @author_1.books.create!(title: "Leviathan Wakes", page_count: 465, publication_year: 2014)
    @book_2 = @author_3.books.create!(title: "The Fellowship of the Ring", page_count: 624, publication_year: 1954)

    @book_1.authors << @author_2

    visit '/books'
  end

  it "shows the following information
      - title
      - page count
      - publication year
      - the name of each author that wrote the book" do

    within "#book-#{@book_1.id}" do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.page_count)
      expect(page).to have_content(@book_1.publication_year)
      expect(page).to have_content(@author_1.name)
      expect(page).to have_content(@author_2.name)
    end

    within "#book-#{@book_2.id}" do
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content(@book_2.page_count)
      expect(page).to have_content(@book_2.publication_year)
      expect(page).to have_content(@author_3.name)
    end
  end
end
