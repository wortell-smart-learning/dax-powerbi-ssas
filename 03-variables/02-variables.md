# Variables

Prober de volgende opdrachten uit te voeren met behulp van variabelen en het VAR-keyword

1. Maak een nieuwe *measure* met de naam `TweePlusTweeMeasure`
   * Zorg dat zich in de measure een variabele met de naam `Twee` bevindt, en de waarde `2`
   * Het resultaat van de measure moet het optellen van deze variabele met zichzelf zijn
   * Voeg een *visual* toe waarin je deze measure uitzet tegen *Calendar Year*. Zijn de resultaten als verwacht?
2. Maak nu een *calculated column* aan met de naam `TweePlusTweeColumn`, in de tabel `Dimension Date`. Geef deze dezelfde definitie als `TweePlusTweeMeasure`.
   * Voeg aan de visual nu ook *TweePlusTweeColumn* toe. Verklaar wat er achter de schermen gebeurt:
     * Waarom krijg je de getallen die je ziet?
     * Wat rekent Power BI achter de schermen uit?
     * Komt het getal (wellicht gedeeld door 2) je bekend voor?
3. Maak een nieuwe *calculated column* aan met de naam `TweePlusTweeVoorEvenJaren`. Deze moet de waarde `2` bevatten voor even jaren, en `3` voor de overige jaren
   * Je kunt bepalen of een jaar even is door een modulo 2 uit te voeren met de `MOD` functie (de modulo is de "rest" van een deelsom)
4. Maak een *measure* aan met de naam `VreemdeBelasting`.
   * Voor de even jaren neem je de som van `Tax Amt`
   * Voor de oneven jaren neem je 25% over `Profit`
   * Binnen een *measure* kun je niet direct de waarde van één jaar gebruiken. Om dit op te lossen, sla je als eerste stap het huidige geselecteerde jaar op in een variabele. Dit kun je ophalen met `MAX('Dimension Date'[Calendar Year])`. Gebruik deze variabele
