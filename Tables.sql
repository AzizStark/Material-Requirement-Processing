
CREATE TABLE bom (itno NUMBER(4),name varchar(15), rate NUMBER(7)); 
INSERT INTO bom (itno, name, rate) VALUES (1, 'Yarn', 46);
INSERT INTO bom (itno, name, rate) VALUES (2, 'Fabric', 80);
INSERT INTO bom (itno, name, rate) VALUES (3, 'Dye', 30);
INSERT INTO bom (itno, name, rate) VALUES (4,'Decorative',12);

CREATE TABLE mrp (productno NUMBER(5),pname VARCHAR(20),YARNQTY NUMBER(7),FABRICQTY NUMBER(7),DYEQTY NUMBER(7),DECORATIVESQTY NUMBER(7));
INSERT INTO mrp (productno,pname,YARNQTY,FABRICQTY,DYEQTY,DECORATIVESQTY) VALUES (7011,'Shirt',5,5,1,12);
INSERT INTO mrp (productno,pname,YARNQTY,FABRICQTY,DYEQTY,DECORATIVESQTY) VALUES (7012,'Pant',7,6,2,20);
INSERT INTO mrp (productno,pname,YARNQTY,FABRICQTY,DYEQTY,DECORATIVESQTY) VALUES (7013,'Saree',4,7,3,18);

CREATE TABLE demand (DEDATE DATE NOT NULL,YARNDMD NUMBER(10),FABRICDMND NUMBER(10),DYEDMD NUMBER(10),DECORATIVESDMD NUMBER(10),PRODUCTNO NUMBER(7));
CREATE TABLE prodemand(DEDATE DATE ,pname VARCHAR(20),productno NUMBER(5),produtreq NUMBER(7));








// don't run below queries
                                                                                           
INSERT INTO prodemand (DEDATE, pname, productno, produtreq) VALUES (TO_DATE('01/01/19','DD/MM/YYYY'),'Shirts',7011,40);
INSERT INTO prodemand (DEDATE, pname, productno, produtreq) VALUES (TO_DATE('01/01/2019','DD/MM/YYYY'),'Pants',7012,23);
INSERT INTO prodemand (DEDATE, pname, productno, produtreq) VALUES (TO_DATE('01/01/2019','DD/MM/YYYY'),'Sarees',7013,34);

SELECT produtreq FROM prodemand WHERE dedate = '01/01/2019' AND pname = 'Decoratives';
SELECT * FROM prodemand;

INSERT INTO demand (DEDATE, YARNDMD, FABRICDMND, DYEDMD, DECORATIVESDMD,PRODUCTNO)
VALUES (TO_DATE('01/01/2019','DD/MM/YYYY'),
((SELECT produtreq FROM prodemand WHERE dedate = '01/01/2019' AND PRODUCTNO  = 7011)*(SELECT YARNQTY FROM MRP WHERE PRODUCTNO = 7011)),
((SELECT produtreq FROM prodemand WHERE dedate = '01/01/2019' AND PRODUCTNO  = 7011)*(SELECT FABRICQTY FROM MRP WHERE PRODUCTNO = 7011)),
((SELECT produtreq FROM prodemand WHERE dedate = '01/01/2019' AND PRODUCTNO  = 7011)*(SELECT DYEQTY FROM MRP WHERE PRODUCTNO = 7011));
