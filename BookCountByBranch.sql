SELECT COUNT(*), lb.branchname
AS BookCount
	FROM book_loans bl INNER JOIN library_branch lb
	ON bl.branchid = lb.branchid
	GROUP BY bl.BranchID