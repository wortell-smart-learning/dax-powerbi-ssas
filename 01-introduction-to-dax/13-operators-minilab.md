# Operators

Om de werking van operators wat te "testen" gaan we een flink aantal *calculated columns* en *calculated measures* aanmaken. Open hiervoor het bestand **14-operators-minilab**

## Arithmetic (rekenkundig)

Om de rekenkundige operators te testen, maken we een eenvoudige measure aan waarin we direct enkele berekeningen uitvoeren. Sleep de measures naar het canvas om te kijken of de inhoud klopt met je verwachtingen. Wellicht moet je nog even schakelen van visual om het resultaat goed weer te geven.

1. `4 = 2 + 2`
2. `5 = 4 + 2` (je leest het goed)
3. `groot = 10 ^ 200`
4. `Het is vandaag maandag = WEEKDAY(TODAY()) = 2`

## Logical (logisch)

5. Maak een measure met de naam `Is het vandaag donerdag?` die twee waarden kan hebben:
   * Als het vandaag donderdag is: "Het is vandaag donderdag"
   * Als het vandaag geen donderdag is: "Het is vandaag geen donderdag!"
   * Gebruik IF
6. Maak een measure met de naam `Gegroet`. De measure kan de volgende waarden hebben:
   * Voor 12:00 "Goedemorgen!"
   * Na 12:00 "Goedemiddag!"
   * Gebruik **IF**, **HOUR** en **NOW()**
   * *(Bonus, pas proberen als de measure werkt: Na 19:00 "Goedenavond!")*
7. Combineer nu de measures 5 en 6 in een nieuwe measure `De Donderdagochtendgroet`
   * Op donderdagmiddag: "Het is donderdagmiddag!!"
   * Op alle andere tijden: de waarde van de measure `Gegroet`
   * Gebruik slechts één IF-statement binnen deze measure

## Concatenation

7. Pas de functie van stap 6 aan, zodat je bij je (login)naam wordt genoemd in de tekst.
   * Gebruik hier de functie **USERPRINCIPALNAME()** voor
   * De tekst ziet er nu uit als "Goedemiddag, koos@bitrainer.nl!"
