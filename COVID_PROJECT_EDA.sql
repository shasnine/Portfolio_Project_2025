SELECT *
FROM CovidDeaths
WHERE continent IS NOT NULL



SELECT 
	Location,
	date,
	total_cases,
	new_cases,
	total_deaths,
	population,
	CONCAT(ROUND((total_deaths/total_cases)*100,2),' ','%') AS DeathPercentage
FROM dbo.CovidDeaths
WHERE total_deaths IS NOT NULL
	AND location LIKE '%desh%'
ORDER BY 1,2


SELECT 
	Location,
	date,
	total_cases,
	new_cases,
	total_deaths,
	population,
	CONCAT(ROUND((total_cases/population)*100,2),' ','%') AS CasePercentage
FROM dbo.CovidDeaths
WHERE total_deaths IS NOT NULL
	AND location LIKE '%desh%'
ORDER BY 1,2





------------------------------------------------------------
-------GLOBAL NUMBERS: NEW CASES/DEATHS/DEATH PERCE---------
------------------------------------------------------------
SELECT
	--date,
	SUM(new_cases) AS TotalNewCases,
	SUM(CAST(new_deaths AS INT)) AS TotalNewDeaths,
	SUM(CAST(new_deaths AS INT))/SUM(new_cases)* 100 AS DeathPercentage
	--total_cases,
	--total_deaths,
	--(total_deaths/total_cases)*100 AS DeathPercentage
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
	--AND new_cases IS NOT NULL
--GROUP BY date
ORDER BY 1,2

-------------------------------------------
-------GLOBAL NUMBERS: BY CONTINET---------
-------------------------------------------
SELECT 
	continent,
	MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
	--SUM(CAST(total_deaths AS INT)) AS GlobalDeathCount
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY TotalDeathCount DESC

--- HIGHEST LEVEL LOCATION

SELECT 
	location,
	MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
	--SUM(CAST(total_deaths AS INT)) AS GlobalDeathCount
FROM dbo.CovidDeaths
WHERE continent IS NULL 
GROUP BY location
ORDER BY TotalDeathCount DESC

--- BY COUNTRIES

SELECT 
	Location,
	population,
	MAX(total_cases) AS HighestInfectionCount ,
	ROUND(MAX(total_cases/population)*100,2) AS InfectionPercentage
FROM dbo.CovidDeaths
GROUP BY location, population
HAVING MAX(total_cases) IS NOT NULL
	--OR ROUND(MAX(total_cases/population)*100,2) IS NOT NULL
	--OR population IS NOT NULL
ORDER BY HighestInfectionCount DESC, InfectionPercentage DESC



-- Time Series of New Vaccination

SELECT 
	d.continent,
	d.location,
	d.date,
	d.population,
	v.new_vaccinations
FROM dbo.CovidDeaths d
JOIN dbo.CovidVaccination v
	ON d.location = v.location
	AND d.date = v.date
WHERE d.continent IS NOT NULL
	AND new_vaccinations IS NOT NULL
ORDER BY 2,3


-- Vaccination and Death Percentage by Country

SELECT 
	d.location,
	SUM(v.people_vaccinated) AS TotalVaccinataion,
	SUM(d.population) AS TotalPopulation,
	ROUND((SUM(v.people_vaccinated) / MAX(d.population)) * 100,2) AS vaccination_perc,
	ROUND((SUM(d.total_deaths)/SUM(d.total_cases)) * 100,2) AS death_rate_percent
FROM dbo.CovidDeaths d
JOIN dbo.CovidVaccination v
ON d.location = v.location
	AND d.date = v.date
WHERE v.people_vaccinated IS NOT NULL
	AND d.continent IS NOT NULL
GROUP BY d.location
--ORDER BY death_rate_percent DESC

