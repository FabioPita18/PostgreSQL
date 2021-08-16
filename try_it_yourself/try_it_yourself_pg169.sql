--10.1
-- The r value of pct_bachelors_higher and median_hh_income is about .57, which
-- shows a lower connection between percent master's degree or higher and
-- income than percent bachelor's degree or higher and income. One possible
-- explanation is that attaining a master's degree or higher may have a more
-- incremental impact on earnings than attaining a bachelor's degree.

SELECT
    round(
      corr(median_hh_income, pct_bachelors_higher)::numeric, 2
      ) AS bachelors_income_r,
    round(
      corr(median_hh_income, pct_masters_higher)::numeric, 2
      ) AS masters_income_r
FROM acs_2011_2015_stats;

--10.2
-- In 2015, Milwaukee and Albuquerque had the two highest rates of motor
-- vehicle theft:

SELECT
    city,
    st,
    population,
    motor_vehicle_theft,
    round(
        (motor_vehicle_theft::numeric / population) * 100000, 1
        ) AS vehicle_theft_per_100000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY vehicle_theft_per_100000 DESC;

--In 2015, Detroit and Memphis had the two highest rates of violent crime.

SELECT
    city,
    st,
    population,
    violent_crime,
    round(
        (violent_crime::numeric / population) * 100000, 1
        ) AS violent_crime_per_100000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY violent_crime_per_100000 DESC;

--10.3
-- Cuyahoga County Public Library tops the rankings with 12,963 visits per
-- thousand people (or roughly 13 visits per person).

SELECT
    libname,
    stabr,
    visits,
    popu_lsa,
    round(
        (visits::numeric / popu_lsa) * 1000, 1
        ) AS visits_per_1000,
    rank() OVER (ORDER BY (visits::numeric / popu_lsa) * 1000 DESC)
FROM pls_fy2014_pupld14a
WHERE popu_lsa >= 250000;