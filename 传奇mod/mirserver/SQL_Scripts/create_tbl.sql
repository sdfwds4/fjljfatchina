/* **************************************************************************
	
	Create Database for Legend of Mir 2

	All written by Euy-heon, Jeong
	Copyright (C) 2001 Wemade Entertainment. All rights reserved.

   *************************************************************************** */

USE LEGENDOFMIR
GO

DROP TABLE TBL_ACCOUNT
GO

DROP TABLE TBL_MONSTER
GO

DROP TABLE TBL_STDITEM
GO

DROP TABLE TBL_MAGIC
GO

DROP TABLE TBL_MONGEN
GO

DROP TABLE TBL_MAPINFO
GO

DROP TABLE TBL_MERCHANT
GO

DROP TABLE TBL_MOVEMAPEVENT
GO

DROP TABLE TBL_GUARD
GO

DROP TABLE TBL_STARTPOINT
GO

DROP TABLE TBL_NPC
GO

/* 
	User Account Table 
*/

CREATE TABLE TBL_ACCOUNT
(
	FLD_LOGINID		CHAR(10)		NOT NULL,		
	FLD_PASSWORD		CHAR(10)		NOT NULL,		
	FLD_USERNAME		CHAR(20)		NOT NULL,		
	FLD_SSNO		CHAR(14)		NOT NULL,		
	FLD_BIRTHDAY		CHAR(10)		NOT NULL,
	FLD_PHONE		CHAR(14)		NOT NULL,
	FLD_MOBILEPHONE	CHAR(13)		NOT NULL,
	FLD_ADDRESS1		VARCHAR(20)		NULL,
	FLD_ADDRESS2		VARCHAR(20)		NULL,
	FLD_EMAIL		VARCHAR(40)		NULL,
	FLD_QUIZ1		VARCHAR(20)		NULL,
	FLD_ANSWER1		VARCHAR(20)		NULL,
	FLD_QUIZ2		VARCHAR(20)		NULL,
	FLD_ANSWER2		VARCHAR(20)		NULL
)
GO

ALTER TABLE TBL_ACCOUNT ADD CONSTRAINT PK_ACCOUNT PRIMARY KEY (FLD_LOGINID)
GO

CREATE INDEX IDX_ACCOUNT_SSNO ON TBL_ACCOUNT (FLD_SSNO ASC)
GO

CREATE INDEX IDX_ACCOUNT_NAME ON TBL_ACCOUNT (FLD_USERNAME ASC)
GO

/* 
	Monster 
*/

CREATE TABLE TBL_MONSTER
(
	FLD_NAME		CHAR(14)		NOT NULL,
	FLD_RACE		SMALLINT		NULL,
	FLD_RACEIMG		SMALLINT		NULL,
	FLD_APPR		SMALLINT		NULL,
	FLD_LEVEL		SMALLINT		NULL,
	FLD_UNDEAD		SMALLINT		NULL,
	FLD_EXP			SMALLINT		NULL,
	FLD_HP			SMALLINT		NULL,
	FLD_MP			SMALLINT		NULL,
	FLD_AC			SMALLINT		NULL,
	FLD_MAXAC		SMALLINT		NULL,
	FLD_MAC		SMALLINT		NULL,
	FLD_MAXMAC		SMALLINT		NULL,
	FLD_DC			SMALLINT		NULL,
	FLD_MAXDC		SMALLINT		NULL,
	FLD_SPEED		SMALLINT		NULL,
	FLD_HIT			SMALLINT		NULL,
	FLD_WALKSPEED		SMALLINT		NULL,
	FLD_ATTACKSPEED	SMALLINT		NULL,
)
GO

/* 
	Standard Item
*/

CREATE TABLE TBL_STDITEM
(
	FLD_INDEX		INT			NOT NULL,
	FLD_NAME		CHAR(14)		NOT NULL,		/* 아이템 명 */
	FLD_STDMODE		SMALLINT		NULL,			
	FLD_SHAPE		SMALLINT		NULL,			/* 형태별 이름 */
	FLD_WEIGHT		SMALLINT		NULL,			/* 무게 */
	FLD_ANICOUNT		SMALLINT		NULL,			/* 1보다 크면 에니메이션 되는 아이템 */
	FLD_SOURCE		SMALLINT		NULL,			/* 재질 (0:기본, 1이상:더 단단함) */
	FLD_RESERVED		SMALLINT		NULL,
	FLD_LOOKS		INT			NULL,			/* 그림 번호 */
	FLD_DURAMAX		INT			NULL,
	FLD_AC			SMALLINT		NULL,			/* 방어력 */
	FLD_AC2			SMALLINT		NULL,
	FLD_MAC		SMALLINT		NULL,			/* 마항력 */
	FLD_MAC2		SMALLINT		NULL,
	FLD_DC			SMALLINT		NULL,			/* 데미지 */
	FLD_DC2			SMALLINT		NULL,
	FLD_MC			SMALLINT		NULL,			/* 술사의 마법 파워 */
	FLD_MC2		SMALLINT		NULL,
	FLD_SC			SMALLINT		NULL,			/* 도사의 정신력 */
	FLD_SC2			SMALLINT		NULL,
	FLD_NEED		SMALLINT		NULL,			/* 0:Level, 1:DC, 2:MC, 3:SC */
	FLD_NEEDLEVEL		SMALLINT		NULL,			/* 1...60 레벨 값 */
	FLD_PRICE		INT			NULL,
	FLD_STOCK		INT			NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO

ALTER TABLE TBL_STDITEM ADD CONSTRAINT PK_MONSTER PRIMARY KEY (FLD_INDEX)
GO

/* 
	Magic Item
*/

CREATE TABLE TBL_MAGIC
(
	FLD_INDEX		INT			NOT NULL,
	FLD_NAME		CHAR(12)		NOT NULL,
	FLD_EFFECTTYPE		SMALLINT		NULL,
	FLD_EFFECT		SMALLINT		NULL,
	FLD_SPELL		SMALLINT		NULL,
	FLD_POWER		SMALLINT		NULL,
	FLD_MAXPOWER		SMALLINT		NULL,
	FLD_DEFSPELL		SMALLINT		NULL,
	FLD_DEFPOWER		SMALLINT		NULL,
	FLD_DEFMAXPOWER	SMALLINT		NULL,
	FLD_JOB			SMALLINT		NULL,
	FLD_NEEDL1		SMALLINT		NULL,
	FLD_L1TRAIN		INT			NULL,
	FLD_NEEDL2		SMALLINT		NULL,
	FLD_L2TRAIN		INT			NULL,
	FLD_NEEDL3		SMALLINT		NULL,
	FLD_L3TRAIN		INT			NULL,
	FLD_DELAY		SMALLINT		NULL,
	FLD_DESC		CHAR(8)			NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO

ALTER TABLE TBL_MAGIC ADD CONSTRAINT PK_MAGIC PRIMARY KEY (FLD_INDEX)
GO

/* 
	Monster Generation Info
*/

CREATE TABLE TBL_MONGEN
(
	FLD_INDEX		INT			NOT NULL,
	FLD_MAPNAME		CHAR(14)		NOT NULL,
	FLD_X			INT			NOT NULL,
	FLD_Y			INT			NULL,
	FLD_MONNAME		CHAR(14)		NULL,
	FLD_AREA		SMALLINT		NULL,
	FLD_COUNT		SMALLINT		NULL,
	FLD_GENTIME		INT			NULL,
	FLD_SMALLGENRATE	INT			NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO

ALTER TABLE TBL_MONGEN ADD CONSTRAINT PK_MONGEN PRIMARY KEY (FLD_INDEX)
GO

/* 
	Map Information
*/

CREATE TABLE TBL_MAPINFO
(
	FLD_MAPFILENAME	CHAR(14)		NOT NULL,
	FLD_MAPNAME		VARCHAR(40)		NOT NULL,
	FLD_SERVERINDEX	SMALLINT		NOT NULL,
	FLD_ATTRIBUTE		INT			NULL,
	FLD_RECALLMAPFNAME	CHAR(14)		NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO

ALTER TABLE TBL_MAPINFO ADD CONSTRAINT PK_MAPINFO PRIMARY KEY (FLD_MAPFILENAME)
GO

/* 
	Move Map Event Information
*/

CREATE TABLE TBL_MOVEMAPEVENT
(
	FLD_INDEX		INT			NOT NULL,
	FLD_SMAPFILENAME	CHAR(14)		NOT NULL,
	FLD_SX			INT			NOT NULL,
	FLD_SY			INT			NOT NULL,
	FLD_DMAPFILENAME	CHAR(14)		NOT NULL,
	FLD_DX			INT			NOT NULL,
	FLD_DY			INT			NOT NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO

ALTER TABLE TBL_MOVEMAPEVENT ADD CONSTRAINT PK_MOVEMAPEVENT PRIMARY KEY (FLD_INDEX)
GO

/* 
	Merchant
*/

CREATE TABLE TBL_MERCHANT
(
	FLD_ID			CHAR(14)		NOT NULL,
	FLD_MAPNAME		CHAR(14)		NOT NULL,
	FLD_POSX		INT			NOT NULL,
	FLD_POSY		INT			NOT NULL,
	FLD_NPCNAME		VARCHAR(40)		NOT NULL,
	FLD_FACE		INT			NOT NULL,
	FLD_BODY		INT			NOT NULL,
	FLD_GENDER		SMALLINT		NOT NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO

/*ALTER TABLE TBL_MERCHANT ADD CONSTRAINT PK_MOVEMAPEVENT PRIMARY KEY (FLD_INDEX)
GO */

/* 
	Guard
*/

CREATE TABLE TBL_GUARD
(
	FLD_INDEX		INT			NOT NULL,
	FLD_ID			CHAR(14)		NOT NULL,
	FLD_MAPNAME		CHAR(14)		NOT NULL,
	FLD_POSX		INT			NOT NULL,
	FLD_POSY		INT			NOT NULL,
	FLD_DIRECTION		SMALLINT		NOT NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO

/*ALTER TABLE TBL_MERCHANT ADD CONSTRAINT PK_MOVEMAPEVENT PRIMARY KEY (FLD_INDEX)
GO */

/* 
	NPC
*/

CREATE TABLE TBL_NPC
(
	FLD_INDEX		INT			NOT NULL,
	FLD_NAME		CHAR(14)		NOT NULL,
	FLD_RACE		SMALLINT		NOT NULL,
	FLD_MAPNAME		CHAR(14)		NOT NULL,
	FLD_POSX		INT			NOT NULL,
	FLD_POSY		INT			NOT NULL,
	FLD_FACE		SMALLINT		NOT NULL,
	FLD_BODY		SMALLINT		NOT NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO

/*ALTER TABLE TBL_MERCHANT ADD CONSTRAINT PK_MOVEMAPEVENT PRIMARY KEY (FLD_INDEX)
GO */

/* 
	NPC
*/

CREATE TABLE TBL_STARTPOINT
(
	FLD_INDEX		INT			NOT NULL,
	FLD_MAPNAME		CHAR(14)		NOT NULL,
	FLD_POSX		INT			NOT NULL,
	FLD_POSY		INT			NOT NULL,
	FLD_DESCRIPTION	VARCHAR(100)		NULL,
)
GO
