insert into tbCategories 
(categId, categLib, categTaxe)
values
('A', 'système', 0.19),
('B', 'mémoire', 0.25),
('C', 'périphérique', 0.33),
('D', 'logiciels', null);

insert into tbVilles
(vilId, vilLib)
values
(1300, 'wavre'),
(5000, 'Namur'),
(1000, 'Bruxelles'),
(1348, 'Ottignies-LLN'),
(4000, 'Liège');

insert into tbVendeurs 
(vendId, vendNom, vendPrenom, vendSexe, vilId, vendDateNaiss)
values
('v01', 'ADAM', 'André', 'm', 1300, '1970/02/01'),
('v02', 'BREST', 'Jacques', 'm', 5000, '1982/05/10'),
('v03', 'CAIN', 'Nicole', 'f', 5000, '1969/01/26'),
('v04', 'ADAM', 'Henri', 'm', 1000, '1981/05/12'),
('v05', 'CARON', 'André', 'm', 5000, '1920/06/06'),
('v06', 'DEPRÉ', 'Jeanne', 'f', 1300, '1995/04/13'),
('v07', 'DEVILLERS', 'Anne', 'f', 1000, '1995/04/13');

insert into tbObjectifs 
(vendId, moisId, objChiffre)
values
('v01', 1, 1500),
('v02', 1, 8000),
('v03', 1, 1500),
('v04', 1, 2000),
('v05', 1, 1505),
('v01', 2, 1800),
('v02', 2, 9000),
('v03', 2, 1505),
('v04', 2, 2505),
('v05', 2, 1750);

insert into tbProduits 
(prodId, prodLib, prodPrix, categId)
values
('p01', 'imprimante', 550, 'C'),
('p02', 'lecteur CD', 125, 'B'),
('p03', 'écran', 120, 'C'),
('p04', 'système A', 560, 'A'),
('p05', 'disque', 100, null),
('p06', 'système B', 990, 'A'),
('p07', 'kit clean', 100, null);

insert into tbCommandes
(commId, vendId, moisId)
values
('0010', 'v02', 1),
('0011', 'v03', 1),
('0015', 'v01', 1),
('0020', 'v02', 1),
('0026', 'v02', 1),
('0030', 'v04', 1),
('0033', 'v01', 2),
('0039', 'v04', 2),
('0050', 'v02', 2),
('0051', 'v02', 2);

insert into tbVentes
(commId, ligneNo, prodId, prodQuant)
values
('0010', 1, 'p01', 5),
('0010', 2, 'p05', 8),
('0010', 3, 'p02', 2),
('0011', 1, 'p02', 3),
('0011', 2, 'p03', 10),
('0015', 1, 'p05', 9),
('0015', 2, 'p02', 7),
('0020', 1, 'p01', 4),
('0020', 2, 'p02', 5),
('0020', 3, 'p03', 11),
('0026', 1, 'p04', 1),
('0030', 1, 'p05', 2),
('0030', 2, 'p02', 4),
('0030', 3, 'p04', 5),
('0033', 1, 'p02', 8),
('0033', 2, 'p05', 7),
('0039', 1, 'p02', 11),
('0050', 1, 'p05', 12),
('0050', 2, 'p02', 15),
('0051', 1, 'p04', 10),
('0051', 2, 'p02', 8),
('0051', 3, 'p05', 7),
('0051', 4, 'p07', 10);