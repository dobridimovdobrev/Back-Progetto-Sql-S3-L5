create database PoliziaMunicipale;
use PoliziaMunicipale;

create table Anagrafica(
	IdAnagrafica int identity(1,1) primary key,
	Cognome nvarchar(25) not null,
	Nome nvarchar(25) not null,
	Indirizzo nvarchar(100) not null,
	Citta nvarchar(50) not null,
	Cap char(5) not null,
	CodiceFiscale char(16) not null unique
)

create table TipoViolazione(
	IdViolazione int identity(1,1) primary key,
	Descrizione nvarchar(1000) not null
)

create table Verbale(
	IdVerbale int identity(1,1) primary key,
	DataViolazione datetime not null,
	IndirizzoViolazione nvarchar(100) not null,
	NominativoAgente nvarchar(100) not null,
	DataTrascrizioneVerbale datetime not null,
	Importo decimal (6,2) not null,
	DecurtamentoPunti int not null,
	IdAnagrafica int not null,
	IdViolazione int not null,
	Constraint FK_VerbaleAnagrafica foreign key (IdAnagrafica) references Anagrafica (IdAnagrafica),
	Constraint FK_VerbaleTipoViolazione foreign key (IdViolazione) references TipoViolazione(IdViolazione)
)


--popolazione tabelle

insert into Anagrafica (Cognome, Nome, Indirizzo, Citta, Cap, CodiceFiscale)
values 
('Rossi', 'Mario', 'Via Roma 15', 'Palermo', '90100', 'RSSMRA80A01G273W'),
('Bianchi', 'Giuseppe', 'Via Libertà 45', 'Palermo', '90141', 'BNCGPP75C15G273Y'),
('Verdi', 'Laura', 'Corso Calatafimi 123', 'Palermo', '90129', 'VRDLRA85M50G273Z'),
('Neri', 'Antonio', 'Via Maqueda 78', 'Palermo', '90133', 'NRTNTN70D20G273X'),
('Gialli', 'Maria', 'Viale Strasburgo 234', 'Palermo', '90146', 'GLLMRA88E45G273K'),
('Blu', 'Francesco', 'Via Ruggero Settimo 56', 'Catania', '95100', 'BLUFNC82F12C351M'),
('Viola', 'Giovanna', 'Via Etnea 189', 'Catania', '95131', 'VLOGNN79H55C351P'),
('Arancio', 'Salvatore', 'Corso Italia 67', 'Messina', '98100', 'RNCSVT77L23F158Q'),
('Rosa', 'Carmela', 'Via Garibaldi 90', 'Palermo', '90139', 'RSOCML83T50G273R'),
('Marrone', 'Pietro', 'Via Dante 45', 'Palermo', '90125', 'MRRPTR76P15G273S');

insert into TipoViolazione (Descrizione)
values
('Eccesso di velocità'),
('Divieto di sosta'),
('Passaggio con semaforo rosso'),
('Guida senza patente'),
('Mancato uso delle cinture di sicurezza'),
('Uso del telefono cellulare alla guida'),
('Inversione di marcia vietata'),
('Sorpasso vietato'),
('Guida in stato di ebbrezza'),
('Mancata precedenza');

insert into Verbale (DataViolazione, IndirizzoViolazione, NominativoAgente, DataTrascrizioneVerbale, Importo, DecurtamentoPunti, IdAnagrafica, IdViolazione)
values
('2020-02-15 09:30:00', 'Via Roma - Palermo', 'Agente Russo Paolo', '2020-02-16 14:20:00', 150.00, 3, 1, 1),
('2021-03-10 15:45:00', 'Via Libertà - Palermo', 'Agente Marino Anna', '2021-03-11 10:15:00', 80.00, 0, 2, 2),
('2019-04-20 11:20:00', 'Corso Calatafimi - Palermo', 'Agente Costa Luigi', '2019-04-21 16:30:00', 200.00, 5, 3, 3),
('2022-05-05 18:10:00', 'Via Maqueda - Palermo', 'Agente Ferrara Maria', '2022-05-06 09:45:00', 500.00, 10, 4, 4),
('2018-06-12 08:50:00', 'Viale Strasburgo - Palermo', 'Agente Rizzo Franco', '2018-06-13 11:30:00', 75.00, 0, 5, 5),
('2023-02-28 14:15:00', 'Via Roma - Palermo', 'Agente Russo Paolo', '2023-03-01 13:20:00', 100.00, 2, 1, 6),
('2017-07-08 16:40:00', 'Via Ruggero Settimo - Palermo', 'Agente Marino Anna', '2017-07-09 10:50:00', 120.00, 4, 6, 7),
('2024-03-25 10:25:00', 'Via Maqueda - Palermo', 'Agente Costa Luigi', '2024-03-26 15:00:00', 450.00, 8, 7, 8),
('2016-04-15 12:35:00', 'Corso Calatafimi - Palermo', 'Agente Ferrara Maria', '2016-04-16 09:20:00', 600.00, 10, 8, 9),
('2025-05-20 17:50:00', 'Via Libertà - Palermo', 'Agente Rizzo Franco', '2025-05-21 11:10:00', 150.00, 5, 9, 10),
('2015-06-30 13:40:00', 'Via Roma - Palermo', 'Agente Russo Paolo', '2015-07-01 14:30:00', 85.00, 0, 10, 2),
('2021-02-18 08:20:00', 'Viale Strasburgo - Palermo', 'Agente Marino Anna', '2021-02-19 16:45:00', 200.00, 6, 1, 1),
('2019-07-15 15:10:00', 'Via Dante - Palermo', 'Agente Costa Luigi', '2019-07-16 10:25:00', 90.00, 0, 2, 5),
('2022-03-30 11:55:00', 'Via Garibaldi - Palermo', 'Agente Ferrara Maria', '2022-03-31 13:40:00', 180.00, 4, 9, 1),
('2020-06-25 09:15:00', 'Corso Italia - Palermo', 'Agente Rizzo Franco', '2020-06-26 15:50:00', 420.00, 7, 4, 8);



--Query Database

--1 conteggio verbali
--select count(*) as VerbaliTotale from Verbale;

--2 verbali per anagrafica
select Anagrafica.Cognome, Anagrafica.Nome, count(Verbale.IdVerbale) as VerbaliTotale 
from Anagrafica
left join Verbale on Anagrafica.IdAnagrafica = Verbale.IdAnagrafica 
group by Anagrafica.Cognome, Anagrafica.Nome

--3 verbali tipo violazione
select TipoViolazione.Descrizione, count(Verbale.IdVerbale) as VerbaliTotale
from TipoViolazione
left join Verbale on TipoViolazione.IdViolazione = Verbale.IdViolazione
group by TipoViolazione.Descrizione;

--4 totale punti per anagrafica
select Anagrafica.Cognome, Anagrafica.Nome, sum(Verbale.DecurtamentoPunti) as PuntiTotali
from Anagrafica
left join Verbale on Anagrafica.IdAnagrafica = Verbale.IdAnagrafica
group by Anagrafica.Cognome, Anagrafica.Nome;

--5 anagrafici residenti a Palermo con violazioni
select Anagrafica.Cognome, Anagrafica.Nome, Verbale.DataViolazione, Verbale.IndirizzoViolazione, Verbale.Importo, Verbale.DecurtamentoPunti
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica = Verbale.IdAnagrafica
where Anagrafica.Citta = 'Palermo';

--6 violazioni febbraio-luglio 2019
select Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Indirizzo, Verbale.DataViolazione, Verbale.Importo, Verbale.DecurtamentoPunti
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica = Verbale.IdAnagrafica
where Verbale.DataViolazione between '2019-02-01' and '2019-07-31';

--7 totale importi per anagrafica
select Anagrafica.Cognome, Anagrafica.Nome, sum(Verbale.Importo) as ImportoTotale
from Anagrafica
left join Verbale on Anagrafica.IdAnagrafica = Verbale.IdAnagrafica
group by Anagrafica.Cognome, Anagrafica.Nome;

--8 tutti gli anagrafici residenti a Palermo
select *
from Anagrafica
where Anagrafica.Citta = 'Palermo';

--9 violazioni per data specifica
declare @Data date = '2020-02-15';
select Verbale.DataViolazione, Verbale.Importo, Verbale.DecurtamentoPunti
from Verbale
where cast(Verbale.DataViolazione as date) = @Data;

--10 violazioni per agente
select Verbale.NominativoAgente, count(*) as ViolazioniTotali
from Verbale
group by Verbale.NominativoAgente;

--11 violazioni con decurtamento maggiore di 5 punti
select Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Indirizzo, Verbale.DataViolazione, Verbale.Importo, Verbale.DecurtamentoPunti
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica = Verbale.IdAnagrafica
where Verbale.DecurtamentoPunti > 5;

--12 violazioni con importo maggiore di 400 euro
select Anagrafica.Cognome, Anagrafica.Nome, Anagrafica.Indirizzo, Verbale.DataViolazione, Verbale.Importo, Verbale.DecurtamentoPunti
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica = Verbale.IdAnagrafica
where Verbale.Importo > 400;
