SELECT b.name, b.[address], COUNT(b.name) AS BooksCheckedOut
	FROM borrower b INNER JOIN book_loans bl
		ON b.cardno = bl.cardno
	GROUP BY b.name, b.[address]
	HAVING COUNT(bl.cardno) > 5