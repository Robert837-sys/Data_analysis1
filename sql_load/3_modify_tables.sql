/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

NOTE: If you are having issues with permissions. And you get error: 

'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'

1. Open pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course` database
3. Right-click `sql_course` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM 'C:\Users\Administrator\Desktop\DataNerd\csv_files\company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy company_dim FROM '[Insert File Path]/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:\Users\Administrator\Desktop\DataNerd\csv_files\skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy skills_dim FROM '[Insert File Path]/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'C:\Users\Administrator\Desktop\DataNerd\csv_files\job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy job_postings_fact FROM '[Insert File Path]/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '[Insert File Path]/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy skills_job_dim FROM 'C:\Users\Administrator\Desktop\DataNerd\csv_files\skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This has been updated from the video to fix issues with encoding

COPY company_dim
FROM 'C:\Users\Administrator\Desktop\DataNerd\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Users\Administrator\Desktop\DataNerd\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Users\Administrator\Desktop\DataNerd\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Users\Administrator\Desktop\DataNerd\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


SELECT * 
FROM job_postings_fact 
LIMIT 100;

SELECT job_posted_date
FROM job_postings_fact
LIMIT 100

SELECT 
    '2023-02-19'::DATE,
    '123'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;

SELECT 
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date ) AS date_month
FROM
    job_postings_fact
WHERE 
    job_title_short='Data Analyst'
GROUP BY
    date_month
ORDER BY
    job_posted_count DESC;
-- LIMIT 5;

SELECT 
    AVG(salary_year_avg),
    AVG(salary_hour_avg)
FROM 
    job_postings_fact
WHERE 
    job_posted_date > '2023-06-01'::DATE
GROUP BY
    job_schedule_type;


SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=1
LIMIT 10;


CREATE TABLE january_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date)=1;

CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

CREATE TABLE april_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

CREATE TABLE may_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

CREATE TABLE june_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

CREATE TABLE july_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

CREATE TABLE august_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

CREATE TABLE september_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

CREATE TABLE october_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

CREATE TABLE november_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

CREATE TABLE december_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 12;

SELECT job_posted_date
FROM march_jobs;


SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location='Anywhere' THEN 'Remote'
        WHEN job_location='New York,NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM   job_postings_fact
WHERE
    job_title_short='Data Analyst'
GROUP BY 

SELECT salary_rate,
    CASE 
    WHEN salary_rate_year>=960000 THEN 'highest' 
    WHEN salary_rate_year =  325000 THEN 'Standard'
    ELSE 'Lowest'
END AS salary_values
FROM job_postings_fact
GROUP BY salary_rate;
        
SELECT *
FROM ( -- Subquery starts here
    SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

WITH january_jobs AS (SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1)
SELECT *
FROM january_jobs;


SELECT  company_id,
        name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM 
            job_postings_fact
    WHERE 
            job_no_degree_mention=true
    ORDER BY company_id
)

WITH company_job_count AS (SELECT 
        company_id,
        COUNT(*) AS total_jobs
FROM 
        job_postings_fact
GROUP BY
        company_id)
SELECT company_dim.name AS company_name,
        company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id=company_dim.company_id
ORDER BY 
        total_jobs DESC;

SELECT 
    skill_id,
    COUNT(*) 
FROM skills_job_dim
GROUP BY skill_id
ORDER BY COUNT(*) DESC;

SELECT *
FROM job_postings_fact

/*
Find the count of the number of remote job postings per skill
-   Display the top 5 skills by their demand in remote jobs
-   Include skill ID, name, and count of postings requiring the skill
*/
WITH remote_job_skills AS (
        SELECT 
                skill_id,
                COUNT(*) AS skill_count
        FROM skills_job_dim AS skills_to_job
        INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id=skills_to_job.job_id
        WHERE job_postings.job_work_from_home=True
        GROUP BY skill_id
) 
SELECT 
    skill.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id=remote_job_skills.skill_id 
ORDER BY skill_count DESC
LIMIT 5;
/*
Label new column as follows:
-'Anywhere' jobs as 'Remote'
-'New York' jobs as 'NYC'
-Otherwise 'Onsite'
*/

-- UNION combines two or more tables.
-- in UNIONs, tables must have same number of columns.

SELECT 
    job_title_short, 
    company_id, 
    job_location
FROM
    january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;

-- UNION ALL combine the result -set of two or more SELECT statements.
-- in UNION ALLs, tables must have same number of columns.
-- UNION ALL does not eliminate duplicate rows.
-- UNION ALL is faster than UNION.
-- data type of columns must be same.
-- if data type is different, then data type of columns must be compatible.
-- if data type is not compatible, then data type of columns must be cast to compatible data type.

SELECT 
    job_title_short, 
    company_id, 
    job_location
FROM
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;

SELECT *
FROM job_postings_fact

SELECT 
    skill_id
FROM skills_dim

UNION ALL
SELECT job_id
FROM skills_job_dim

SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::date,
    quarter1_job_postings.salary_year_avg
FROM(
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE quarter1_job_postings.salary_year_avg > 70000 AND 
    quarter1_job_postings.job_title_short='Data Analyst'
ORDER BY
    quarter1_job_postings.salary_year_avg DESC