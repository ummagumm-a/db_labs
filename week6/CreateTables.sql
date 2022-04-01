CREATE TABLE if not exists SuppliersT (
	sid INT PRIMARY KEY,
	sname VARCHAR (50),
	address VARCHAR (50)
);

CREATE TABLE if not exists PartsT (
	pid INT PRIMARY KEY,
	pname VARCHAR(50),
	color VARCHAR(50)
);

CREATE TABLE if not exists CatalogT (
	sid int, 
	pid int, 
	cost_ float(2),
	
	PRIMARY KEY (sid, pid),
	FOREIGN KEY (sid) 
		REFERENCES SuppliersT(sid),
	FOREIGN KEY (pid) 
		REFERENCES PartsT(pid)
);