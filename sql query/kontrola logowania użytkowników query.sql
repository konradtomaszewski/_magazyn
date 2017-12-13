SELECT 
uzytkownicy.imie,
uzytkownicy.nazwisko,
czaspracy.godzina_start,
czaspracy.godzina_koniec,
TIMEDIFF(czaspracy.godzina_koniec, czaspracy.godzina_start) as 'czas pracy',
TIMEDIFF(czaspracy.godzina_koniec, czaspracy.godzina_start + INTERVAL 1 DAY) as 'czas przerwy'
FROM czaspracy
LEFT JOIN uzytkownicy ON uzytkownicy.id_uzyt=czaspracy.id_uzytkownika
WHERE YEAR( godzina_start ) =2017
AND MONTH( godzina_start ) =10
AND czaspracy.ID_UZYTKOWNIKA =198