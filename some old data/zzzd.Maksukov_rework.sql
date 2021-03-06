CREATE TABLE "damage" (
	"id" serial NOT NULL,
	"type" VARCHAR(3) NOT NULL,
	"1lvl dmg" int NOT NULL	CONSTRAINT damage_1lvl_dmg_chk CHECK ("1lvl dmg" > 0),
	CONSTRAINT damage_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
)
;




CREATE TABLE "survival" (
	"id" serial NOT NULL,
	"hp"   int NOT NULL	CONSTRAINT survival_hp_chk CHECK ("hp" > 0),
	"armor" int NOT NULL	CONSTRAINT survival_armor_chk     CHECK ("armor" > 0),
	"mag rez" int NOT NULL CONSTRAINT survival_mag_rez_chk  CHECK ("mag rez" > 0),
	CONSTRAINT survival_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "lines" (
	"id" serial NOT NULL,
	"line" VARCHAR(30) NOT NULL UNIQUE,
	CONSTRAINT lines_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "roles" (
	"id" serial NOT NULL ,
	"role" VARCHAR(30) NOT NULL UNIQUE,
	CONSTRAINT roles_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "champions" (
	"id" serial NOT NULL,
	"champions" VARCHAR(40) NOT NULL UNIQUE,
	"damage" int NOT NULL   REFERENCES "damage"("id"),
	"survival" int NOT NULL REFERENCES "survival"("id"),
	"line" int NOT NULL     REFERENCES "lines"("id"),
	"role" int NOT NULL     REFERENCES "roles"("id"),
	CONSTRAINT champions_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




CREATE TABLE "division" (
	"id" serial NOT NULL ,
	"div" VARCHAR(20) NOT NULL UNIQUE,
	CONSTRAINT division_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ingame" (
  
	"div" int NOT NULL	REFERENCES "division"("id"),
	"champ" int NOT NULL	REFERENCES "champions"("id"),
	"ban chance" float NOT NULL	CONSTRAINT ingame_ban_chance_chk CHECK ("ban chance" > 0),
	"win rate" float NOT NULL	CONSTRAINT ingame_win_rate_chk CHECK ("win rate" > 0),
	"pick chance" float NOT NULL	CONSTRAINT ingame_pick_chance_chk CHECK ("pick chance" > 0)   
) WITH (
  OIDS=FALSE
);










INSERT INTO "roles" ("id","role") VALUES 
	

(1,	'assassin'),
(2,	'fighter'),
(3,	'mage'),
(4,	'adc'),
(5,	'supp'),
(6,	'tank')
;




INSERT INTO "lines" ("id","line") VALUES 
(1,	'top'),
(2,	'mid'),
(3,	'jungle'),
(4,	'adc'),
(5,	'supp'),
(6,	'top+jungle'),
(7,	'supp+jungle'),
(8,	'mid+jungle'),
(9,	'top+mid'),
(10,	'adc+jungle'),
(11,	'mid+supp')
;





INSERT INTO "damage" ("id","type","1lvl dmg") VALUES 

(1,'ad',91),
(2,'ap',70),
(3,'ad',78),
(4,'ad',85),
(5,'ad',82),
(6,'ap',73),
(7,'ap',65),
(8,'ad',75),
(9,'ap',74),
(10,'ad',69),
(11,'ad',86),
(12,'ap',67),
(13,'ad',82),
(14,'ap',61),
(15,'ad',90)
;



INSERT INTO "survival" ("id","hp","armor","mag rez") VALUES 


(1,	666,	66,	66),
(2,	572,	52,	78),
(3,	834,	90,	72),
(4,	643,	64,	74),
(5,	715,	87,	93),
(6,	625,	57,	81),
(7,	537,	83,	66),
(8,	804,	62,	63),
(9,	746,	94,	72),
(10,	819,	75,	57),
(11,	682,	86,	62),
(12,	698,	72,	72),
(13,	782,	96,	51),
(14,	614,	55,	56),
(15,	759,	72,	83)
;



INSERT INTO "champions" ("id","champions","damage","survival","line","role") VALUES 



(1,	'aatrox',    1,   1,   6,   2),
(2,	'ahri',      2,   2,   2,   3),
(3,	'dr.mundo',  3,   3,   6,   6),
(4,	'draven',    4,   4,   4,   4),
(5,	'fiora',     5,   5,   1,   2),
(6,	'akali',     6,   6,   2,   1),
(7,	'sona',      7,   7,   5,   5),
(8,	'hecarim',   8,   8,   3,   2),
(9,	'fizz',      9,   9,   8,   1),
(10,	'nautilus',  10,  10,  7,   6),
(11,	'twitch',    11,  11,  10,  4),
(12,	'brand',     12,  12,  11,  3),
(13,	'olaf',      13,  13,  6,   2),
(14,	'teemo',     14,  14,  1,   4),
(15,	'irelia',    15,  15,  1,   2)
;



INSERT INTO "division" ("id","div") VALUES 

(1,	'diamond'),
(2,	'platinum'),
(3,	'gold'),
(4,	'silver'),
(5,	'bronze')
;



	

INSERT INTO "ingame" ("div","champ","ban chance","win rate","pick chance") VALUES 



(1,	1,	0.1,		49.19,	0.2),
(1,	2,	6.2,		50.23	,	2.5),
(1,	3,	0.6,		49.42	,	0.7),
(1,	4,	24.2,		52.01	,	2.3),
(1,	5,	26.4,		51.19	,	1.9),
(1,	6,	7.3,		50.81	,	1.2),
(1,	7,	3.3,		54.78	,	3.1),
(1,	8,	3.1,		50.11	,	1.0),
(1,	9,	21.1,		49.99	,	2.1),
(1,	10,	0.4,		46.19	,	0.6),
(1,	11,	33.5,		53.10	,	5.1),
(1,	12,	5.5,		51.44	,	2.01),
(1,	13,	1.2,		44.79	,	0.6),
(1,	14,	8.2,		51.01	,	2.2),
(1,	15,	2.1,		51.22	,	1.3),
(2,	1,	0.2,		49.29	,	0.19),
(2,	2,	6.6,		50.4	,	2.7),
(2,	3,	0.6,		49.27,	0.9),
(2,	4,	26.1,		51.97,	2.4),
(2,	5,	27,		51.23	,	2  ),
(2,	6,	8.1,		50.85	,	1.1),
(2,	7,	3.4,		54.60	,	3.4),
(2,	8,	3.3,		50.26	,	1.2),
(2,	9,	22.2,		50.3	,	2.4),
(2,	10,	0.5,		46.34	,	0.7),
(2,	11,	35,		52.2	,	5.3),
(2,	12,	5.6,		51.55	,	1.9),
(2,	13,	1,		44.67	,	0.8),
(2,	14,	8.9,		51.24	,	2.5),
(2,	15,	2.2,		51.4	,	1.4),
(3,	1,	0.3,		49.66	,	1.8),
(3,	2,	6.9,		51	,	2.9),
(3,	3,	0.6,		49.17	,	1  ),
(3,	4,	26.3,		52.10	,	2.5),
(3,	5,	27.3,		51.34	,	1.8),
(3,	6,	8.4,		50.88	,	1.2),
(3,	7,	3.5,		54.71	,	3.2),		
(3,	8,	3.2,		50.3	,	1.3),
(3,	9,	22,		50.6	,	2.6),
(3,	10,	0.6,		47	,	0.6),
(3,	11,	34.1,		51.9	,	5.2),
(3,	12,	5.7,		51.47	,	1.7),
(3,	13,	0.9,		44.8	,	0.9),
(3,	14,	9,		51.3	,	2.6),
(3,	15,	2.3,		51	,	1.5),
(4,	1,	0.4,		48.19	,	0.2),
(4,	2,	6.1,		51.23	,	2.5),
(4,	3,	0.7,		48.42	,	0.7),
(4,	4,	25.2,		53.01	,	2.3),
(4,	5,	27.4,		50.19	,	1.7),
(4,	6,	7.6,		51.81	,	1.3),
(4,	7,	3.5,		53.78	,	3.1),
(4,	8,	3.1,		50.1	,	1.1),
(4,	9,	20.1,		48.9	,	2.1),
(4,	10,	0.7,		47.19	,	0.6),
(4,	11,	31.5,		54.10	,	5.1),
(4,	12,	5.7,		53.47	,	1.8),
(4,	13,	1.3,		43.9	,	0.3),
(4,	14,	8.2,		52.01	,	2  ),
(4,	15,	2.1,		52.22	,	1.3),	
(5,	1,	0.5,		49.46	,	1.8),
(5,	2,	6.8,		51.32	,	2.6),
(5,	3,	0.7,		46.17	,	1.5),
(5,	4,	27.3,		51.10	,	2.4),
(5,	5,	27.9,		51.14	,	1.7),
(5,	6,	8.5,		50.68	,	1.2),
(5,	7,	3.1,		51.71	,	3.5),		
(5,	8,	3.34,		52.3	,	1.3),
(5,	9,	22.3,		53.6	,	2.6),
(5,	10,	0.7,		47.6	,	0.6),
(5,	11,	35.1,		50.9	,	5.2),
(5,	12,	5.8,		51.7	,	1.7),
(5,	13,	0.8,		44.2	,	0.9),
(5,	14,	9.1,		51.6	,	2.6),
(5,	15,	2.5,		51.3	,	1.5)	
;
