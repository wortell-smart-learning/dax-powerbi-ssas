# Row Context en Iterator-functies

Open het Power BI bestand `35-row-context-iterators-minilab`.

1. Maak in de tabel *Fact Sale* een measure `Sum of Profit Per Item`, gedefinieerd door `SUM('Fact Sale'[Profit] / 'Fact Sale'[Quantity])`
   * Leg uit waarom dit niet lukt
   * Gebruik de *iterator functie* `SUMX` om het alsnog te laten lukken.
1. Maak in de tabel *Fact Sale* een *calculated column* met de naam *Typical Weight per Unit*. Vul deze met de waarde van de kolom `Typical Weight per Unit` uit de tabel `Dimension Stock Item`.
1. Maak in de tabel *Fact Sale* een measure `Amount`, gedefinieerd door de som van `'Fact Sale'[Quantity]` vermenigvuldigd met `Dimension Stock Item[Unit Price]`
1. Implementeer de measure *Y-Profits* met een *iterator*-functie:
   * Wanneer de geselecteerde stad met een **Y** begint, geef je de `'Fact Sale'[Profit]` aan
   * In alle overige gevallen geef je `BLANK()` terug
   * Bedenk vooraf over welke tabel je wilt gaan itereren en waarom. Als je hier niet uitkomt: vraag even om hulp!
1. Maak een nieuwe measure met de naam `Nettowinst`
   * Als de *Size* van een product gelijk is aan *S*, is de waarde gelijk aan `'Fact Sale'[Quantity] * 'Dimension Stock Item'[Recommended Retail Price]`
   * In alle overige gevallen moet hier nog (`'Dimension Stock Item'[Unit Price]`) vanaf getrokken worden
