# Context - lab 2

Open het bestand `04-context-lab2.pbix`

1. Maak in de tabel *Fact Sale* een measure `Amount`, gedefinieerd door `SUM([Quantity] * [Unit Price])`
   * Leg uit waarom dit niet lukt
1. Maak in de tabel *Fact Sale* een *calculated column* met de naam *Typical Weight per Unit*. Vul deze met de waarde van de kolom `Typical Weight per Unit` uit de tabel `Dimension Stock Item`
1. Maak opnieuw de measure *Y-Profits Z-losses iterator* aan.
   * **Nieuw**: gebruik deze keer niet de `MAX()`-functie, maar maak gebruik van een *iterator-functie*
   * Zorg ervoor dat de **total** rij ook echt een optelling is van de boven weergegeven waarden
   * Wanneer de geselecteerde stad met een **Y** begint, geef je de winst aan
   * Wanneer de stad met een **Z** begint, geef je de winst weer als verlies (-1 * ...)
   * In alle overige gevallen geef je een 0 terug
   * Bekijk het resultaat
     * Is dit als verwacht?
     * Verklaar opnieuw de waarde van de **total** rij
1. Maak een nieuwe measure met de naam `Nettowinst`
   * Als de *Size* van een product gelijk is aan *S*, is de waarde gelijk aan `'Fact Sale'[Quantity] * 'Dimension Stock Item'[Recommended Retail Price]`
   * In alle overige gevallen moeten hier nog de kosten (`'Dimension Stock Item'[Unit Price]`) vanaf getrokken worden
