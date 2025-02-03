
INSERT INTO core.tenant (id, "domain") 
        VALUES(100, 'localhost');

INSERT INTO core.organization (id, "name", biz_code, tenant_id) 
        VALUES(100, 'HSTPathways Surgery Center', 'hstsurgery', 100);

INSERT INTO core.config (id, description) 
		VALUES(100, 'Common Config Category');  
INSERT INTO core.config (id, partof, description) 
		VALUES(101, 100, 'Organization or Location Logo url');
INSERT INTO core.config (id, partof, description) 
        VALUES(102, 100, 'Center GUID Mapping');
INSERT INTO core.config (id, description) 
        VALUES(200, 'Database Config Category');
INSERT INTO core.config (id, partof, description) 
        VALUES(201, 200, 'Plain JSON Config');
INSERT INTO core.config (id, partof, description) 
        VALUES(202, 200, 'Database AWS Secret Name');        
INSERT INTO core.config (id, partof, description) 
        VALUES(203, 200, 'Database Host Address or Name');        
INSERT INTO core.config (id, partof, description) 
        VALUES(204, 200, 'Database Host Port');        
INSERT INTO core.config (id, partof, description) 
        VALUES(205, 200, 'Database Name');        
INSERT INTO core.config (id, partof, description) 
        VALUES(206, 200, 'Database Engine');        
INSERT INTO core.config (id, partof, description) 
        VALUES(207, 200, 'Database UserName');        
INSERT INTO core.config (id, partof, description) 
        VALUES(208, 200, 'Database Password');        
INSERT INTO core.config (id, partof, description) 
        VALUES(209, 200, 'Database Password Sub-Key of Secret');     
		
INSERT INTO core.org_config (org_id, cfg_id, "value") 
        VALUES(100, 101, 'https://dsbni6n8jxa99.cloudfront.net/Help/logo/AP-1.png');
    
INSERT INTO core.org_config (org_id, cfg_id, "value") 
        VALUES(100, 201, '{"username":"sa","password":"hst@9asc","engine":"sqlserver","host":"localhost","port":1433,"database":"HSTASC"}');
    
INSERT INTO core.product (id, code, pathbase, description) 
    VALUES(40, 'EC', 'HSTeChart','EChart Cloud');

INSERT INTO core."location" (id, org_id, center_guid, "name") 
    VALUES(100, 100, '1C760BAE-24DC-4130-A52B-815AF68977E8', 'Main Surgery Center');
INSERT INTO core."location" (id, org_id, center_guid, "name") 
    VALUES(101, 100, '7FAD4636-6623-4991-BE1C-422096F70517', 'Main Fiscal Year Center');
INSERT INTO core."location" (id, org_id, center_guid, "name") 
    VALUES(103, 100, '04D71503-6846-4237-8A3A-7C8FC50397D2', 'Main Patient Survey Surgical Center');
INSERT INTO core."location" (id, org_id, center_guid, "name") 
    VALUES(104, 100, 'C1334F56-9FE8-4A13-8FE8-A646792C481F', 'The Main Training Center');
INSERT INTO core."location" (id, org_id, center_guid, "name") 
    VALUES(105, 100, 'AE933CED-63A3-4978-8909-48F48DAD7E82', 'The Main QA Center');

INSERT INTO core.loc_product (id, loc_id, prod_id) 
    VALUES(101, 100, 40);
INSERT INTO core.loc_product (id, loc_id, prod_id) 
    VALUES(104, 101, 40);
INSERT INTO core.loc_product (id, loc_id, prod_id) 
    VALUES(106, 103, 40);
INSERT INTO core.loc_product (id, loc_id, prod_id) 
    VALUES(107, 104, 40);
INSERT INTO core.loc_product (id, loc_id, prod_id) 
    VALUES(109, 105, 40);

INSERT INTO core.loc_prod_config (lp_id, cfg_id, value) 
    VALUES(101, 102, '1');
INSERT INTO core.loc_prod_config (lp_id, cfg_id, value) 
    VALUES(104, 102, '2');
INSERT INTO core.loc_prod_config (lp_id, cfg_id, value) 
    VALUES(106, 102, '4');
INSERT INTO core.loc_prod_config (lp_id, cfg_id, value) 
    VALUES(107, 102, '500');
INSERT INTO core.loc_prod_config (lp_id, cfg_id, value) 
    VALUES(109, 102, '501');







