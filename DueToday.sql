DECLARE @Today DATE = CONVERT(date,SYSDATETIME())
SELECT book.title, b.name, b.[address]
	FROM library_branch lb INNER JOIN book_loans bl
		ON lb.branchid = bl.branchid
	INNER JOIN book
		ON bl.bookid = book.bookid
	INNER JOIN borrower b
		ON bl.cardno = b.cardno
	WHERE lb.BranchName = 'Sharpstown' AND bl.DueDate = @Today
