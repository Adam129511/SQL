/*/SELECT * FROM ksiazki ORDER BY tytul DESC/*/
/*/SELECT * FROM ksiazki ORDER BY cena DESC LIMIT 1/*/
/*/SELECT * FROM zamowienia WHERE status = "wyslano"/*/
/*/SELECT * FROM klienci WHERE nazwisko = "Rutkowski"/*/
/*/SELECT * FROM ksiazki WHERE tytul LIKE "%PHP%"/*/
/*/SELECT * FROM zamowienia ORDER BY data DESC/*/
/*/SELECT z.idzamowienia,z.data,k.imie,k.nazwisko FROM klienci AS k,zamowienia AS z  
WHERE k.idklienta = z.idklienta/*/
/*/SELECT klienci.imie, klienci.nazwisko, zamowienia.idksiazki FROM klienci,zamowienia WHERE idksiazki = 2 AND
zamowienia.idklienta = klienci.idklienta/*/
/*/SELECT ksiazki.tytul, ksiazki.imieautora, ksiazki.nazwiskoautora FROM ksiazki,zamowienia WHERE zamowienia.idklienta = 2 AND
zamowienia.idksiazki=ksiazki.idksiazki/*/
/*/SELECT klienci.imie,klienci.nazwisko, zamowienia.status, zamowienia.data, zamowienia.idzamowienia, ksiazki.tytul FROM ksiazki,zamowienia,klienci 
WHERE klienci .nazwisko = "Rutkowski" AND klienci.idklienta = zamowienia.idklienta AND  ksiazki.idksiazki = zamowienia.idksiazki
ORDER BY zamowienia.data DESC/*/
/*/UPDATE klienci SET nazwisko = "Psikuta" WHERE idklienta=4 /*/
/*/UPDATE ksiazki SET cena=ROUND(1*cena,2)/*/
/*/UPDATE ksiazki SET cena = cena-10 ORDER BY cena DESC limit 1/*/
/*/UPDATE klienci SET imie = "Joanna", nazwisko = "Dostojewska" WHERE idklienta = 10/*/
/*/UPDATE zamowienia SET status = "wyslano" WHERE idzamowienia=4 OR idzamowienia =5/*/
/*/INSERT INTO klienci VALUES (NULL,"Franciszek", "Janowski","Chorzów")/*/
/*/INSERT INTO zamowienia (idzamowienia,data,status,idklienta,idksiazki) VALUES (NULL,"2020-01-02","oczekiwanie",7,3)/*/
/*/INSERT INTO ksiazki (idksiazki, nazwiskoautora,tytul) VALUES(NULL,"Grzębosz","Symfonia C++")/*/
/*/INSERT INTO klienci VALUES(NULL,"Michał","Jacek","La"), (NULL,"Mickał","Plackowy","La")/*/
/*/INSERT INTO klienci SET idklienta = NULL, imie = "Roman", nazwisko="kol", miejscowosc="wroclaw"/*/
/*/UPDATE klienci SET miejscowosc = "Wrocław" WHERE idklienta = 14/*/
/*/TRUNCATE TABLE slowa_kluczowe/*/
/*/ DROP TABLE IF EXISTS klienci /*/
/*/SELECT Continent, COUNT(Code) AS IlePanstw FROM country GROUP BY Continent  ORDER BY IlePanstw DESC/*/
/*/SELECT Language, COUNT(CountryCode) as JezykiUzywanePrzezPanstwa FROM countrylanguage, country 
WHERE Continent = "Europe" AND IsOfficial = "T"  AND countrylanguage.CountryCode = country.Code
GROUP BY Language ORDER BY JezykiUzywanePrzezPanstwa DESC/*/
/*/SELECT city.CountryCode, SUM(city.Population) as LiczbaObywateli FROM city, country 
WHERE Continent = "South America" AND country.Population >=100000  AND city.CountryCode = country.Code
GROUP BY country.Name ORDER BY LiczbaObywateli DESC/*/
/*/ILE PTAKÓW NALEŻĄCYCH DO KAZDEGO GATUNKU ZAOBSERWOWALI ORNITOLODZY? PTAKÓW KTÓREGO GATUNKU BYŁO NAJWIECEJ?/*/
/*/SELECT gatunki.ID_gatunku, SUM(liczebnosc) AS liczbaPtakow FROM obserwacje,gatunki WHERE gatunki.ID_gatunku = obserwacje.ID_gatunku GROUP BY gatunki.ID_gatunku ORDER BY LiczbaPtakow DESC/*/
/*/Jakich 10 gatunków ptaków było obiektem najczęśćiej prowadzonych obserwacji przez ornitologów w powiecie gdanskim?/*/
/*/SELECT nazwa_zwyczajowa, COUNT(obserwacje.ID_gatunku) AS obserwowany FROM gatunki,obserwacje,lokalizacje 
WHERE powiat = "gdanski" AND gatunki.ID_gatunku = obserwacje.ID_gatunku AND obserwacje.ID_lokalizacji = lokalizacje.ID_lokalizacji 
GROUP BY nazwa_zwyczajowa ORDER by obserwowany DESC LIMIT 10/*/
/*/W którym powiecie liczba zaobserwowanych ptaków z gatunku dziecioł(liczymy only las) jest najwieksza a w którym największa
SELECT powiat, SUM(obserwacje.liczebnosc) AS obserwowany FROM gatunki,obserwacje,lokalizacje 
WHERE (gatunki.nazwa_zwyczajowa LIKE "%dzieciol%") AND lokalizacje.opis LIKE "%las%" AND gatunki.ID_gatunku = obserwacje.ID_gatunku 
AND obserwacje.ID_lokalizacji = lokalizacje.ID_lokalizacji AND obserwacje.zachowanie = "zeruje" GROUP BY powiat ORDER by obserwowany DESC/*/
/*/SELECT dane_wypozyczen.id_wypozyczenia, samochody.marka, samochody.model FROM dane_wypozyczen INNER JOIN samochody ON samochody.id_samochodu = dane_wypozyczen.id_samochodu
ORDER BY dane_wypozyczen.id_wypozyczenia/*/
/*/SELECT 
pracownicy.nazwisko_pracownika, wypozyczenia.id_wypozyczenia
FROM  pracownicy
LEFT JOIN wypozyczenia ON pracownicy.id_pracownika = wypozyczenia.id_pracownika
ORDER BY wypozyczenia.id_wypozyczenia ASC LIMIT 1/*/
/*/SELECT 
pracownicy.nazwisko_pracownika, wypozyczenia.id_wypozyczenia
FROM  pracownicy
RIGHT JOIN wypozyczenia ON pracownicy.id_pracownika = wypozyczenia.id_pracownika
ORDER BY wypozyczenia.id_wypozyczenia ASC /*/
/*/
SELECT 
pracownicy.imie_pracownika,
pracownicy.nazwisko_pracownika,
wypozyczenia.id_wypozyczenia
FROM pracownicy
LEFT JOIN wypozyczenia ON pracownicy.id_pracownika = wypozyczenia.id_pracownika
WHERE wypozyczenia.id_wypozyczenia IS NULL

UNION

SELECT 
pracownicy.imie_pracownika,
pracownicy.nazwisko_pracownika,
wypozyczenia.id_wypozyczenia
FROM pracownicy
RIGHT JOIN wypozyczenia ON pracownicy.id_pracownika = wypozyczenia.id_pracownika
WHERE wypozyczenia.id_wypozyczenia IS NULL
/*/
/*/
SELECT
SUM(dane_wypozyczen.cena_doba*dane_wypozyczen.ilosc_dob) AS wartosc,
klienci.imie_klienta,
klienci.nazwisko_klienta
FROM dane_wypozyczen
INNER JOIN wypozyczenia ON wypozyczenia.id_wypozyczenia = dane_wypozyczen.id_wypozyczenia
INNER JOIN klienci ON klienci.id_klienta = wypozyczenia.id_klienta
GROUP BY wypozyczenia.id_klienta
/*/
/*/
SELECT
klienci.imie_klienta,
klienci.nazwisko_klienta,
pracownicy.imie_pracownika,
pracownicy.nazwisko_pracownika,
pracownicy.miasto_pracownika AS miasto
FROM klienci
INNER JOIN pracownicy ON klienci.miasto_klienta = pracownicy.miasto_pracownika
/*/
/*/
SELECT
p.nazwisko_pracownika,
s.nazwisko_pracownika AS szef
FROM pracownicy p
 JOIN pracownicy S ON p.szef_id = s.id_pracownika
 /*/
  /*/
 SELECT
REPLACE(klienci.imie_klienta,' ','') 'imie',
trim(klienci.nazwisko_klienta) 'Nazwisko',
klienci.miasto_klienta 'miasto'
FROM klienci
ORDER BY char_length(klienci.miasto_klienta) DESC
 /*/
  /*/
 UPDATE klienci SET klienci.imie_klienta = REPLACE(klienci.imie_klienta,' ',''),
klienci.nazwisko_klienta = trim(klienci.nazwisko_klienta)
 /*/