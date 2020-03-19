# Filtering - lab 1

Open het bestand `05-filtering.pbix`.

1. Maak een calculated table met de naam `Rode Producten`. Zorg er met DAX voor dat deze ook alleen rode producten bevat
   * Controleer de resultaten in de data-weergave van Power BI
2. Maak een calculated measure `Belasting op Rode Producten`. Zorg ervoor dat de som van `Tax Amount` wordt berekend, maar alleen voor de rode producten
   * Zet in een visual de nieuwe measure uit tegen de kolom `[Color]` uit de tabel `Dimensino Stock Item`
   * Je measure kan op twee manieren werken:
     * Optie 1: Alleen de kleur *rood* wordt weergegeven
     * Optie 2: Alle kleuren worden weergegeven, maar bij elke kleur staat alleen de belasting voor alle rode producten
   * Welke optie is bij jou van toepassing? Leg uit waarom dit zo werkt.
   * Probeer een tweede variant van de measure te maken, die de andere optie implementeert
3. Maak een calculated measure `Belasting op alle producten`. Zorg ervoor dat de som van `Tax Amount` wordt berekend, maar dan voor alle producten (ongeacht de filters die er liggen)
4. Op pagina 144 van je boek staat een voorbeeld van de `ALLEXCEPT` functie
   * Werk deze uit met behulp van Power BI (voer de tabel in via **Enter Data**)
   * Maak nu zelf een measure die alle filters van **Dimension Stock Item** verwijdert - behálve de kleur. Gebruik `ALLEXCEPT`.
5. Op pagina 146 van je boek staat een voorbeeld van de `ALLSELECTED` functie
   * Lees deze goed door (je kunt de voorbeelden ook direct uitwerken op het lab-bestand)
   * Kun je een voorbeeld bedenken bij deze functie?