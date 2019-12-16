# As a user,
# When I visit the Book Index Page,
#   Then I see each author's name is a link
# When I click the link
#   Then I am taken to an Author Show Page where I see the author with that id including the author's:
#   - name
#   - the title of each book they have written
#   - the average number of pages for all of their books

require 'rails_helper'

RSpec.describe "When I click an authors name anywhere on the site it links to that authors show page" do
  before :each do
    @author_1 = Author.create!(name: "James S.A. Corey")
    @author_2 = Author.create!(name: "Some Dude")
    @book_1 = @author_1.books.create!(title: "Leviathan Wakes", page_count: 468, publication_year: 2014)
    @book_2 = @author_1.books.create!(title: "Cibola Burn", page_count: 482, publication_year: 2017)
    @book_1.authors << @author_2

    visit '/books'
  end

  it "shows the authors name, title of each authored book, average number of pages for all their books" do
    within "#book-#{@book_1.id}" do
      click_link "#{@author_1.name}"
    end

    expect(current_path).to eq("/authors/#{@author_1.id}")
    expect(page).to have_content(@author_1.name)
    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_2.title)
    expect(page).to have_content(475)
  end
end
