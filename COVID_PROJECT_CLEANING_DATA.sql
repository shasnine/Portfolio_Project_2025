USE PortfolioProject;
GO

SELECT TOP 5 *
FROM dbo.CovidDeaths

SELECT TOP 5 *
FROM dbo.CovidVaccination

EXEC sp_help 'dbo.CovidDeaths';
EXEC sp_help 'dbo.CovidVaccination';

SELECT DISTINCT new_deaths_per_million
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, new_deaths) IS NULL
	AND new_deaths IS NOT NULL;

SELECT DISTINCT total_deaths
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, total_deaths)	IS NULL
	AND total_deaths IS NOT NULL;

SELECT *
FROM dbo.CovidDeaths
WHERE total_deaths = 'total_deaths';

SELECT DISTINCT new_deaths
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, new_deaths) IS NULL
	AND new_deaths IS NOT NULL

SELECT DISTINCT total_deaths_per_million
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, total_deaths_per_million) IS NULL
      AND total_deaths_per_million IS NOT NULL;

SELECT DISTINCT new_deaths_per_million
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, new_deaths_per_million) IS NULL
      AND new_deaths_per_million IS NOT NULL;

SELECT DISTINCT reproduction_rate
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, reproduction_rate) IS NULL
      AND reproduction_rate IS NOT NULL;

SELECT *
INTO dbo.CovidDeaths_backup
FROM dbo.CovidDeaths;

SELECT *
INTO dbo.CovidVaccination_backup
FROM dbo.CovidVaccination

ALTER TABLE dbo.CovidDeaths
ALTER COLUMN total_deaths FLOAT;

SELECT COUNT(*) AS TotalRows
FROM dbo.CovidDeaths

SELECT COUNT(*) AS TotalRows
FROM dbo.CovidVaccination

SELECT DISTINCT icu_patients
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, icu_patients) IS NULL
      AND icu_patients IS NOT NULL;

SELECT DISTINCT icu_patients_per_million
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, icu_patients_per_million) IS NULL
      AND icu_patients_per_million IS NOT NULL;

SELECT DISTINCT hosp_patients
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, hosp_patients) IS NULL
      AND hosp_patients IS NOT NULL;

SELECT DISTINCT hosp_patients
FROM dbo.CovidDeaths
WHERE TRY_CONVERT(float, hosp_patients) IS NULL
      AND hosp_patients IS NOT NULL;

ALTER TABLE dbo.CovidDeaths
ALTER COLUMN weekly_hosp_admissions_per_million
 FLOAT;

 EXEC sp_help 'dbo.CovidDeaths';

 -- TESTING COLUMNS
UPDATE dbo.CovidVaccination SET new_tests = NULL
WHERE TRY_CONVERT(float, new_tests) IS NULL AND new_tests IS NOT NULL;

UPDATE dbo.CovidVaccination SET total_tests = NULL
WHERE TRY_CONVERT(float, total_tests) IS NULL AND total_tests IS NOT NULL;

UPDATE dbo.CovidVaccination SET total_tests_per_thousand = NULL
WHERE TRY_CONVERT(float, total_tests_per_thousand) IS NULL AND total_tests_per_thousand IS NOT NULL;

UPDATE dbo.CovidVaccination SET new_tests_per_thousand = NULL
WHERE TRY_CONVERT(float, new_tests_per_thousand) IS NULL AND new_tests_per_thousand IS NOT NULL;

UPDATE dbo.CovidVaccination SET new_tests_smoothed = NULL
WHERE TRY_CONVERT(float, new_tests_smoothed) IS NULL AND new_tests_smoothed IS NOT NULL;

UPDATE dbo.CovidVaccination SET new_tests_smoothed_per_thousand = NULL
WHERE TRY_CONVERT(float, new_tests_smoothed_per_thousand) IS NULL AND new_tests_smoothed_per_thousand IS NOT NULL;

UPDATE dbo.CovidVaccination SET positive_rate = NULL
WHERE TRY_CONVERT(float, positive_rate) IS NULL AND positive_rate IS NOT NULL;

UPDATE dbo.CovidVaccination SET tests_per_case = NULL
WHERE TRY_CONVERT(float, tests_per_case) IS NULL AND tests_per_case IS NOT NULL;


-- VACCINATION COLUMNS
UPDATE dbo.CovidVaccination SET total_vaccinations = NULL
WHERE TRY_CONVERT(float, total_vaccinations) IS NULL AND total_vaccinations IS NOT NULL;

UPDATE dbo.CovidVaccination SET people_vaccinated = NULL
WHERE TRY_CONVERT(float, people_vaccinated) IS NULL AND people_vaccinated IS NOT NULL;

UPDATE dbo.CovidVaccination SET people_fully_vaccinated = NULL
WHERE TRY_CONVERT(float, people_fully_vaccinated) IS NULL AND people_fully_vaccinated IS NOT NULL;

UPDATE dbo.CovidVaccination SET new_vaccinations = NULL
WHERE TRY_CONVERT(float, new_vaccinations) IS NULL AND new_vaccinations IS NOT NULL;

UPDATE dbo.CovidVaccination SET new_vaccinations_smoothed = NULL
WHERE TRY_CONVERT(float, new_vaccinations_smoothed) IS NULL AND new_vaccinations_smoothed IS NOT NULL;

UPDATE dbo.CovidVaccination SET total_vaccinations_per_hundred = NULL
WHERE TRY_CONVERT(float, total_vaccinations_per_hundred) IS NULL AND total_vaccinations_per_hundred IS NOT NULL;

UPDATE dbo.CovidVaccination SET people_vaccinated_per_hundred = NULL
WHERE TRY_CONVERT(float, people_vaccinated_per_hundred) IS NULL AND people_vaccinated_per_hundred IS NOT NULL;

UPDATE dbo.CovidVaccination SET people_fully_vaccinated_per_hundred = NULL
WHERE TRY_CONVERT(float, people_fully_vaccinated_per_hundred) IS NULL AND people_fully_vaccinated_per_hundred IS NOT NULL;

UPDATE dbo.CovidVaccination SET new_vaccinations_smoothed_per_million = NULL
WHERE TRY_CONVERT(float, new_vaccinations_smoothed_per_million) IS NULL AND new_vaccinations_smoothed_per_million IS NOT NULL;


-- OTHER NUMERIC COLUMNS
UPDATE dbo.CovidVaccination SET extreme_poverty = NULL
WHERE TRY_CONVERT(float, extreme_poverty) IS NULL AND extreme_poverty IS NOT NULL;

UPDATE dbo.CovidVaccination SET female_smokers = NULL
WHERE TRY_CONVERT(float, female_smokers) IS NULL AND female_smokers IS NOT NULL;

UPDATE dbo.CovidVaccination SET male_smokers = NULL
WHERE TRY_CONVERT(float, male_smokers) IS NULL AND male_smokers IS NOT NULL;


-- TESTING COLUMNS
ALTER TABLE dbo.CovidVaccination ALTER COLUMN new_tests FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN total_tests FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN total_tests_per_thousand FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN new_tests_per_thousand FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN new_tests_smoothed FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN new_tests_smoothed_per_thousand FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN positive_rate FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN tests_per_case FLOAT;

-- VACCINATION COLUMNS
ALTER TABLE dbo.CovidVaccination ALTER COLUMN total_vaccinations FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN people_vaccinated FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN people_fully_vaccinated FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN new_vaccinations FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN new_vaccinations_smoothed FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN total_vaccinations_per_hundred FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN people_vaccinated_per_hundred FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN people_fully_vaccinated_per_hundred FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN new_vaccinations_smoothed_per_million FLOAT;

-- OTHER NUMERIC COLUMNS
ALTER TABLE dbo.CovidVaccination ALTER COLUMN extreme_poverty FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN female_smokers FLOAT;
ALTER TABLE dbo.CovidVaccination ALTER COLUMN male_smokers FLOAT;

EXEC sp_help 'dbo.CovidVaccination';

