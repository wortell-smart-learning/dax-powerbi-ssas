# Context - lab 1

1. Open het Power BI bestand `04-context-lab1.pbix`. Bekijk het eerste tabblad
   * Vertel welke filters er actief zijn in de eerste rij in de matrix, onder het jaar 2013
   * Zijn dit expliciete of impliciete filters?
   * Laat ook in de data zien dat dit klopt
   * Doe hetzelfde voor de rij Antares, onder "Total"
2. Schakel naar tabblad 2. Je ziet hier de winst per stad.
   * Vertel welke filters er actief zijn voor de eerste rij
   * Maak een nieuwe *measure* aan met de naam *Sum of Profit in All Cities*
   * Zorg ervoor dat deze de winst weergeeft in alle steden (dus de filter die nu op Dimension City ligt moet verwijderd)
     * Controleer of deze werkt zoals verwacht door de kolom naast de bestaande *Profit*-kolom weer te geven. Hoe weet je of je het correcte getal hebt uitgerekend?
     * Voeg een nieuwe *slicer* toe op basis van *Country*. Werkt de measure nog zoals verwacht?
     * Stel dat je nu dat je alleen alle steden wilt zien, maar de filter op *Country* wel wilt laten liggen, hoe los je dit op?
     * En andersom - als je op elke kolom waarop je kunt filteren in *Dimension City* de filters wilt negeren?
3. Maak een nieuwe measure *Percentage of Total Profit*, waarin de huidige winst (in een stad) wordt gedeeld door de totale winst. Gebruik de functie `DIVIDE`. Zorg ervoor dat deze als een percentage wordt weergegeven.
4. Maak een nieuwe measure *Y-Profits Z-losses* aan.
   * Wanneer de geselecteerde stad met een **Y** begint, geef je de winst aan
   * Wanneer de stad met een **Z** begint, geef je de winst weer als verlies (-1 * ...)
   * In alle overige gevallen geef je een 0 terug
   * Gebruik de `MAX()`-functie om de huidige stad uit te lezen
   * Bekijk het resultaat.
     * Is dit als verwacht?
     * Verklaar de waarde van de **total** rij
