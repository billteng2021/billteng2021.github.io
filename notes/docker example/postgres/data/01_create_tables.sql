CREATE SCHEMA IF NOT EXISTS core;

CREATE TABLE IF NOT EXISTS core.tenant (
	id int4 NOT NULL,
	partof int4 NULL,
	active bool NOT NULL DEFAULT true,
	"domain" varchar(60) NOT NULL,
	CONSTRAINT tenant_pkey
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS core.organization (
	id int4 NOT NULL,
	tenant_id int4 NULL,
	active bool NOT NULL DEFAULT true,
	biz_code varchar(50) NOT NULL,
	"name" varchar(100) NOT NULL,
	CONSTRAINT organization_pkey
		PRIMARY KEY (id),
	CONSTRAINT fky_ten_org 
		FOREIGN KEY (tenant_id) 
			REFERENCES core.tenant(id)
);

CREATE UNIQUE INDEX IF NOT EXISTS organization_biz_code_idx ON core.organization USING btree (biz_code);

CREATE TABLE IF NOT EXISTS core.location (
	id int4 NOT NULL,
	org_id int4 NOT NULL,
	center_guid varchar(36) NOT NULL,
	"name" varchar(227) NOT NULL,
	status bpchar(1) NOT NULL DEFAULT 'A'::bpchar,
	CONSTRAINT location_pkey
		PRIMARY KEY (id),
	CONSTRAINT fky_loc_org 
		FOREIGN KEY (org_id) 
			REFERENCES core.organization(id)
);

CREATE TABLE IF NOT EXISTS core.config (
	id int4 NOT NULL,
	partof int4 NULL,
	description varchar(200) NULL,
	CONSTRAINT config_pkey
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS core.org_config (
	org_id int4 NOT NULL,
	cfg_id int4 NOT NULL,
	value varchar(200) NOT NULL,
	status bpchar(1) NOT NULL DEFAULT 'A'::bpchar,
	CONSTRAINT org_endpoint_pkey
		PRIMARY KEY (org_id, cfg_id),
	CONSTRAINT fky_org_config_cfg 
		FOREIGN KEY (cfg_id) 
			REFERENCES core.config(id),
	CONSTRAINT fky_org_config_org 
		FOREIGN KEY (org_id) 
			REFERENCES core.organization(id)
);

CREATE TABLE IF NOT EXISTS core.product (
	id int4 NOT NULL,
	partof int4 NULL,
    code varchar(6) NOT NULL,
	pathbase varchar(20) NOT NULL,
	description varchar(200) NOT NULL,
	CONSTRAINT product_pkey
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS core.loc_product (
	id int4 NOT NULL,
	loc_id int4 NOT NULL,
	prod_id int4 NOT NULL,
	"comment" varchar(200) NULL,
	status bpchar(1) NOT NULL DEFAULT 'A'::bpchar,
	CONSTRAINT org_prod_pkey
		PRIMARY KEY (id),
	CONSTRAINT fky_loc_prod_loc 
		FOREIGN KEY (loc_id) 
			REFERENCES core.location(id),
	CONSTRAINT fky_loc_prod_prod 
		FOREIGN KEY (prod_id) 
			REFERENCES core.product(id)
);

CREATE TABLE IF NOT EXISTS core.loc_prod_config (
	lp_id int4 NOT NULL,
	cfg_id int4 NOT NULL,
	value varchar(200) NOT NULL,
	status bpchar(1) NOT NULL DEFAULT 'A'::bpchar,
	CONSTRAINT org_prod_cfg_pkey 
		PRIMARY KEY (lp_id, cfg_id),
	CONSTRAINT fky_loc_prod_config_cfg 
		FOREIGN KEY (cfg_id) 
			REFERENCES core.config(id),
	CONSTRAINT fky_loc_prod_config_lp 
		FOREIGN KEY (lp_id) 
			REFERENCES core.loc_product(id)
);











