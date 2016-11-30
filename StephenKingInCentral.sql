SELECT book.Title, lb.BranchName, bc.no_of_copies
	FROM book INNER JOIN book_authors ba
		ON book.bookid = ba.bookid
	INNER JOIN book_copies bc
		ON bc.bookid = ba.bookid
	INNER JOIN library_branch lb
		ON bc.branchid = lb.branchid
WHERE ba.authorname LIKE '%Stephen King%' AND lb.branchname = 'Central'