SELECT TOP(50) [Name],CONVERT(VARCHAR,[Start],23) AS [Start]
	FROM Games
	WHERE [Start] BETWEEN '2011-01-01' AND '2013-01-01'
	ORDER BY [Start],[Name]

SELECT Username, REPLACE(SUBSTRING(Email, CHARINDEX('@',Email), LEN(Email)),'@','') AS [Email Provider]
	FROM Users
	ORDER BY [Email Provider],Username

SELECT Username, IpAddress
	FROM Users
	WHERE IpAddress LIKE '___.1%.%.___'
	ORDER BY Username

SELECT [Name] AS [Game],
CASE
	WHEN DATEPART(HOUR, [Start]) BETWEEN 0 AND 11 THEN 'Morning'
	WHEN DATEPART(HOUR, [Start]) BETWEEN 12 AND 17 THEN 'Afternoon'
	WHEN DATEPART(HOUR, [Start]) BETWEEN 18 AND 23 THEN 'Evening'
END AS [Part of the Day],
CASE
	WHEN Duration <= 3 THEN 'Extra Short'
	WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
	WHEN Duration > 6 THEN 'Long'
	WHEN Duration IS NULL THEN 'Extra Long'
END AS Duration
		FROM Games
		ORDER BY [Name], [Duration]