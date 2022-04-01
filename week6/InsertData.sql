insert into PartsT (pid, pname, color) values (1, 'red1', 'red');
insert into PartsT (pid, pname, color) values (2, 'red2', 'red');
insert into PartsT (pid, pname, color) values (3, 'green1', 'green');
insert into PartsT (pid, pname, color) values (4, 'blue1', 'blue');
insert into PartsT (pid, pname, color) values (5, 'red3', 'red');

insert into suppliersT (sid, sname, address) values (1, 'Yosemite Sham', 'Devil''s canyon, AZ');
insert into suppliersT (sid, sname, address) values (2, 'Wiley E. Coyote', 'RR Asylum, NV');
insert into suppliersT (sid, sname, address) values (3, 'Elmer Fudd', 'Carrot Patch, MN');

insert into CatalogT (sid, pid, cost_) values (1, 1, 10.0);
insert into CatalogT (sid, pid, cost_) values (1, 2, 20.0);
insert into CatalogT (sid, pid, cost_) values (1, 3, 30.0);
insert into CatalogT (sid, pid, cost_) values (1, 4, 40.0);
insert into CatalogT (sid, pid, cost_) values (1, 5, 50.0);
insert into CatalogT (sid, pid, cost_) values (2, 1, 9.0);
insert into CatalogT (sid, pid, cost_) values (2, 3, 34.0);
insert into CatalogT (sid, pid, cost_) values (2, 5, 48.0);
insert into CatalogT (sid, pid, cost_) values (3, 4, 15.0);