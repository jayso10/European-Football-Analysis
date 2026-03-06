-- Football data from 2008/2009 to 2015/2016

SELECT * 
FROM football.country;

SELECT *
FROM football.league;

SELECT *
FROM football.matches;

SELECT *
FROM football.team;

-- Data Cleaning -- 
-- We will clean the data for each individual table before joining them into one big table 
-- 1. Find Duplicates 
-- 2. Standardize data
-- 3. Check for nulls



-- Checking for duplicates in Team table
WITH RankedTeams AS (
	SELECT *, 
		ROW_NUMBER() OVER(PARTITION BY id, team_api_id, team_fifa_api_id, team_long_name, team_short_name
							ORDER BY id
						) AS rt
	FROM team
)

SELECT * 
FROM RankedTeams
WHERE rt > 1;

-- checking null
SELECT *
FROM team
WHERE team_api_id IS NULL OR id IS NULL;

-- standardizing team table
UPDATE team
SET team_long_name = TRIM(team_long_name);

UPDATE team
SET team_short_name = TRIM(team_short_name);


-- checking for duplicates in country table

WITH RankedCountry AS (
	SELECT *,
			ROW_NUMBER() OVER(PARTITION BY id, name) AS rc
	FROM country
)
SELECT *
FROM RankedCountry
WHERE rc > 1;

-- standardizing 
UPDATE country
SET name = TRIM(name);

-- Duplicates for league

WITH RankedLeague AS (
	SELECT *,
		ROW_NUMBER() OVER(PARTITION BY id, country_id, name) AS rl
	FROM league
)
SELECT *
FROM RankedLeague
WHERE rl > 1;

-- checking country_id validity for league table

SELECT DISTINCT country_id
FROM league
WHERE country_id NOT IN (SELECT id FROM country);

-- standardizing league 
UPDATE league
SET name = TRIM(name);

-- checking duplicates for matches
WITH RankedMatches AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY date, home_team_api_id, away_team_api_id
      ORDER BY id
    ) AS rn
  FROM matches
)

DELETE FROM matches
WHERE id IN (
  SELECT id FROM RankedMatches WHERE rn > 1
);

-- checking for nulls

SELECT *
FROM matches
WHERE country_id IS NULL
   OR league_id IS NULL
   OR season IS NULL
   OR date IS NULL
   OR home_team_api_id IS NULL
   OR away_team_api_id IS NULL;
   
   -- standardizing
   
SELECT id, date 
FROM matches 
WHERE DATE_FORMAT(date, '%Y-%m-%d') IS NULL;

SELECT DISTINCT season 
FROM matches 
ORDER BY season;

-- incase there is a data in season column not in this yyyy/yyyy format
UPDATE matches
SET season = CONCAT(LEFT(season, 4), '/', RIGHT(season, 2))
WHERE season NOT LIKE '%/%';

SELECT *
FROM matches
WHERE home_team_goal < 0 OR away_team_goal < 0;


-- NOW ALL THE TABLES ARE CLEAN TIME FOR JOINING 

-- Used view so we could reuse this query without rewriting everytime 
CREATE VIEW joined_matches AS
SELECT
  m.id AS match_id,
  m.date,
  m.season,
  m.stage,
  c.name AS country,
  l.name AS league,
  ht.team_long_name AS home_team,
  at.team_long_name AS away_team,
  m.home_team_goal,
  m.away_team_goal
FROM matches m
JOIN country c ON m.country_id = c.id
JOIN league l ON m.league_id = l.id
JOIN team ht ON m.home_team_api_id = ht.team_api_id
JOIN team at ON m.away_team_api_id = at.team_api_id;

SELECT * 
FROM joined_matches;

-- Lets do some exploratory analysis and answer some questions


-- Main Dashboard

-- Q1. Total matches 
SELECT COUNT(*) AS total_matches 
FROM joined_matches;

-- Q2. Total goals
SELECT SUM(home_team_goal + away_team_goal) AS total_goals
FROM joined_matches;

-- Q3. Total Seasons
SELECT COUNT(DISTINCT season)
FROM joined_matches;

-- Q4. Total Teams
SELECT COUNT(DISTINCT team_id) AS total_teams
FROM (
  SELECT home_team AS team_id FROM joined_matches
  UNION ALL
  SELECT away_team FROM joined_matches
) AS all_teams;

-- Q5. Total leagues
SELECT COUNT(DISTINCT league) AS total_leagues 
FROM joined_matches;

-- Q6: Which Season were the most goals scored
SELECT  season,  SUM(home_team_goal + away_team_goal) AS total_goals
FROM joined_matches
GROUP BY season
ORDER BY total_goals desc;

-- Q7: Which league had the most goals
SELECT league, SUM(home_team_goal + away_team_goal) AS total_goals
FROM joined_matches
GROUP BY league
ORDER BY total_goals desc;

-- Q8: Total goals scored by team (home and away)
SELECT
  team_name,
  SUM(goals_scored) AS total_goals
FROM (
  SELECT
    home_team AS team_name,
    SUM(home_team_goal) AS goals_scored
  FROM joined_matches
  GROUP BY home_team

  UNION ALL

  SELECT
    away_team AS team_name,
    SUM(away_team_goal) AS goals_scored
  FROM joined_matches
  GROUP BY away_team
) AS goal_data
GROUP BY team_name
ORDER BY total_goals DESC
LIMIT 10;



-- SEASON DASHBOARD

-- 1. Teams with the most wins
SELECT season, winning_team, COUNT(*) AS wins
FROM (
  SELECT season,
         CASE
           WHEN home_team_goal > away_team_goal THEN home_team
           WHEN away_team_goal > home_team_goal THEN away_team
           ELSE NULL
         END AS winning_team
  FROM joined_matches
  WHERE home_team_goal != away_team_goal
) AS win_data
GROUP BY season, winning_team
ORDER BY season, wins DESC;
 
-- 2. Teams with the most goals in each season
SELECT season, team, SUM(goals) AS total_goals
FROM (
  SELECT season, home_team AS team, SUM(home_team_goal) AS goals
  FROM joined_matches
  GROUP BY season, home_team

  UNION ALL

  SELECT season, away_team AS team, SUM(away_team_goal) AS goals
  FROM joined_matches
  GROUP BY season, away_team
) AS goal_data
GROUP BY season, team
ORDER BY season, total_goals DESC;

-- 3. Seasons with most goals scored
SELECT season, SUM(home_team_goal + away_team_goal) AS total_goals
FROM joined_matches
GROUP BY season
ORDER BY total_goals DESC;

-- 4. Seasons with most home wins
SELECT season, COUNT(*) AS home_wins
FROM joined_matches
WHERE home_team_goal > away_team_goal
GROUP BY season
ORDER BY home_wins DESC;

-- 5. Seasons with most away wins
SELECT season, COUNT(*) AS away_wins
FROM joined_matches
WHERE away_team_goal > home_team_goal
GROUP BY season
ORDER BY away_wins DESC;

-- 6. Matches played each season
SELECT season, COUNT(*) AS matches
FROM joined_matches
GROUP BY season
ORDER BY season;

-- 7. Average Goals per Match in Each Season
SELECT season, 
       ROUND(SUM(home_team_goal + away_team_goal) * 1.0 / COUNT(*), 2) AS avg_goals_per_match
FROM joined_matches
GROUP BY season
ORDER BY season;





