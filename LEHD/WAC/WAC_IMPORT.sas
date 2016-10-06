%LET LEHD=//Vboxsvr/data/Census/LEHD/;
LIBNAME LEHD"&LEHD.";

/* This helps to process all state data iteratively. */
DATA STABB;
	LENGTH STABB $2. STFIPS $2.;
	INPUT STABB $ STFIPS $;
	CARDS;
ak 02
al 01
ar 05
az 04
ca 06
co 08
ct 09
dc 11
de 10
fl 12
ga 13
hi 15
ia 19
id 16
il 17
in 18
ks 20
ky 21
la 22
ma 25
md 24
me 23
mi 26
mn 27
mo 29
ms 28
mt 30
nc 37
nd 38
ne 31
nh 33
nj 34
nm 35
nv 32
ny 36
oh 39
ok 40
or 41
pa 42
ri 44
sc 45
sd 46
tn 47
tx 48
ut 49
va 51
vt 50
wa 53
wi 55
wv 54
wy 56
;
RUN;

DATA _NULL_;
	SET STABB END=EOF;
	IF _n_ = 1 THEN CALL EXECUTE("FILENAME WAC (");
	IF STABB NE "wy" THEN CALL EXECUTE(" ""&LEHD."||STABB||"_wac_S000_JT00_2014.csv"" ");
	IF STABB EQ "wy" THEN CALL EXECUTE(" ""&LEHD."||STABB||"_wac_S000_JT00_2013.csv"" ");
	IF EOF THEN CALL EXECUTE(");");
RUN;

OPTIONS NONOTES NOSOURCE; /* This option will turn off most output to the log, otherwise you will most likely have to clear the log as the data step is running other data steps. */
DATA LEHD.WAC14;
	LENGTH 	GEOID $15. C000 CA01 CA02 CA03 CE01 CE02 CE03 CNS01 CNS02 CNS03 CNS04 CNS05 CNS06 CNS07 CNS08 CNS09 CNS10 CNS11 CNS12 CNS13 CNS14 CNS15 CNS16 CNS17 CNS18 CNS19 CNS20 CR01 CR02 CR03 CR04 CR05 CR07 CT01 CT02 CD01 CD02 CD03 CD04 CS01 CS02 CFA01 CFA02 CFA03 CFA04 CFA05 CFS01 CFS02 CFS03 CFS04 CFS05 8. CREATEDATE $8.;
	INFILE WAC DSD DLM="," FIRSTOBS=2 TRUNCOVER LRECL=200 RECFM=V;
	INPUT GEOID $ C000 CA01 CA02 CA03 CE01 CE02 CE03 CNS01 CNS02 CNS03 CNS04 CNS05 CNS06 CNS07 CNS08 CNS09 CNS10 CNS11 CNS12 CNS13 CNS14 CNS15 CNS16 CNS17 CNS18 CNS19 CNS20 CR01 CR02 CR03 CR04 CR05 CR07 CT01 CT02 CD01 CD02 CD03 CD04 CS01 CS02 CFA01 CFA02 CFA03 CFA04 CFA05 CFS01 CFS02 CFS03 CFS04 CFS05 CREATEDATE $;
		LABEL GEOID = "Workplace Census Block Code"
		C000 = "Total number of jobs"
		CA01 = "Number of jobs for workers age 29 or younger"
		CA02 = "Number of jobs for workers age 30 to 54"
		CA03 = "Number of jobs for workers age 55 or older"
		CE01 = "Number of jobs with earnings $1250/month or less"
		CE02 = "Number of jobs with earnings $1251/month to $3333/month"
		CE03 = "Number of jobs with earnings greater than $3333/month"
		CNS01 = "Number of jobs in NAICS sector 11 (Agriculture, Forestry, Fishing and Hunting)"
		CNS02 = "Number of jobs in NAICS sector 21 (Mining, Quarrying, and Oil and Gas Extraction)"
		CNS03 = "Number of jobs in NAICS sector 22 (Utilities)"
		CNS04 = "Number of jobs in NAICS sector 23 (Construction)"
		CNS05 = "Number of jobs in NAICS sector 31-33 (Manufacturing)"
		CNS06 = "Number of jobs in NAICS sector 42 (Wholesale Trade)"
		CNS07 = "Number of jobs in NAICS sector 44-45 (Retail Trade)"
		CNS08 = "Number of jobs in NAICS sector 48-49 (Transportation and Warehousing)"
		CNS09 = "Number of jobs in NAICS sector 51 (Information)"
		CNS10 = "Number of jobs in NAICS sector 52 (Finance and Insurance)"
		CNS11 = "Number of jobs in NAICS sector 53 (Real Estate and Rental and Leasing)"
		CNS12 = "Number of jobs in NAICS sector 54 (Professional, Scientific, and Technical Services)"
		CNS13 = "Number of jobs in NAICS sector 55 (Management of Companies and Enterprises)"
		CNS14 = "Number of jobs in NAICS sector 56 (Administrative and Support and Waste Management and Remediation Services)"
		CNS15 = "Number of jobs in NAICS sector 61 (Educational Services)"
		CNS16 = "Number of jobs in NAICS sector 62 (Health Care and Social Assistance)"
		CNS17 = "Number of jobs in NAICS sector 71 (Arts, Entertainment, and Recreation)"
		CNS18 = "Number of jobs in NAICS sector 72 (Accommodation and Food Services)"
		CNS19 = "Number of jobs in NAICS sector 81 (Other Services [except Public Administration])"
		CNS20 = "Number of jobs in NAICS sector 92 (Public Administration)"
		CR01 = "Number of jobs for workers with Race: White, Alone"
		CR02 = "Number of jobs for workers with Race: Black or African American Alone"
		CR03 = "Number of jobs for workers with Race: American Indian or Alaska Native Alone"
		CR04 = "Number of jobs for workers with Race: Asian Alone"
		CR05 = "Number of jobs for workers with Race: Native Hawaiian or Other Pacific Islander Alone"
		CR07 = "Number of jobs for workers with Race: Two or More Race Groups"
		CT01 = "Number of jobs for workers with Ethnicity: Not Hispanic or Latino"
		CT02 = "Number of jobs for workers with Ethnicity: Hispanic or Latino"
		CD01 = "Number of jobs for workers with Educational Attainment: Less than high school"
		CD02 = "Number of jobs for workers with Educational Attainment: High school or equivalent, no college"
		CD03 = "Number of jobs for workers with Educational Attainment: Some college or Associate degree"
		CD04 = "Number of jobs for workers with Educational Attainment: Bachelor's degree or advanced degree"
		CS01 = "Number of jobs for workers with Sex: Male"
		CS02 = "Number of jobs for workers with Sex: Female"
		CFA01 = "Number of jobs for workers at firms with Firm Age: 0-1 Years"
		CFA02 = "Number of jobs for workers at firms with Firm Age: 2-3 Years"
		CFA03 = "Number of jobs for workers at firms with Firm Age: 4-5 Years"
		CFA04 = "Number of jobs for workers at firms with Firm Age: 6-10 Years"
		CFA05 = "Number of jobs for workers at firms with Firm Age: 11+ Years"
		CFS01 = "Number of jobs for workers at firms with Firm Size: 0-19 Employees"
		CFS02 = "Number of jobs for workers at firms with Firm Size: 20-49 Employees"
		CFS03 = "Number of jobs for workers at firms with Firm Size: 50-249 Employees"
		CFS04 = "Number of jobs for workers at firms with Firm Size: 250-499 Employees"
		CFS05 = "Number of jobs for workers at firms with Firm Size: 500+ Employees"
		createdate = "Date on which data was created, formatted as YYYYMMDD";
	IF SUBSTR(GEOID,1,9)="w_geocode" THEN DELETE;
RUN;
OPTIONS NOTES SOURCE; /* This restores the previously disabled log output. */
OPTIONS NOTES SOURCE;

/* Run this if you want to aggregate the data up to 2010 Census Block Groups. */
PROC SQL;
	CREATE TABLE LEHD.BG14_WAC AS
	SELECT SUBSTR(GEOID,1,12) FORMAT=$12. AS GEOID150,
	SUM(C000) AS JOBS
	FROM LEHD.WAC14
	GROUP BY GEOID150
	ORDER GEOID150;
QUIT;

/* Run this if you want to aggregate the data up to 2010 Census Tracts. */
PROC SQL;
	CREATE TABLE LEHD.BG14_WAC AS
	SELECT SUBSTR(GEOID,1,11) FORMAT=$11. AS GEOID140,
	SUM(C000) AS JOBS
	FROM LEHD.WAC14
	GROUP BY GEOID140
	ORDER GEOID140;
QUIT;

/* This outputs the data to a .dbf which can be used by both ArcGIS and QGIS. */
FILENAME JOBS "//VBOXSVR/data/Viz/JOBDENSITY2014/JOBS.DBF";
PROC DBF DATA=LEHD.BG14_WAC DB4=JOBS;
RUN;
