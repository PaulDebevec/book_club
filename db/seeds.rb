author_1 = Author.create(name: "Daniel Abraham")
author_2 = Author.create(name: "Ty Franck")
author_3 = Author.create(name: "J.R.R. Tolkien")
book_1 = author_1.books.create(title: "Leviathan Wakes", page_count: 465, publication_year: 2014)
book_2 = author_3.books.create(title: "The Fellowship of the Ring", page_count: 624, publication_year: 1954)
book_3 = author_1.books.create(title: "Caliban's War", page_count: 482, publication_year: 2017)

book_1.authors << author_2
book_3.authors << author_2
