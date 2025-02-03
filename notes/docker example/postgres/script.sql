CREATE DATABASE hstcommon
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
	
CREATE SCHEMA tenant
    AUTHORIZATION postgres;
	
//integer	4 bytes	typical choice for integer	-2147483648 to +2147483647
CREATE TABLE tenant.account
(
    uid integer NOT NULL,
    description character varying(50),
    active bit(1) NOT NULL DEFAULT B'1',
    PRIMARY KEY (uid)
);

ALTER TABLE IF EXISTS tenant.account
    OWNER to postgres;

	