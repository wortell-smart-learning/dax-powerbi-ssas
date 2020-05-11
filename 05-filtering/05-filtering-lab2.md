# Lab 2 - filtering

Open het bestand '05-filtering-lab2.pbix'. Je ziet een *running total* over de jaren heen.

1. Maak een calculated measure `Belasting op alle producten`. Zorg ervoor dat de som van `Tax Amount` wordt berekend, maar dan voor alle producten (ongeacht de filters die er liggen)
2. Op pagina 144 van je boek staat een voorbeeld van de `ALLEXCEPT` functie
   * Werk deze uit met behulp van Power BI (voer de tabel in via **Enter Data**)
   * Maak nu zelf een measure die alle filters van **Dimension Stock Item** verwijdert - behálve de kleur. Gebruik `ALLEXCEPT`.
3. Op pagina 146 van je boek staat een voorbeeld van de `ALLSELECTED` functie
   * Lees deze goed door (je kunt de voorbeelden ook direct uitwerken op het lab-bestand)
   * Kun je een voorbeeld bedenken bij deze functie?
4. Open tabblad **Page 2**. Je ziet hier dezelfde tabel, maar dan een niveau dieper. Maak een nieuwe *measure* **My MTD**. Kopieer de definitie van **My YTD** en zorg ervoor dat deze functioneert als een "month-to-date": een *running total* die elke maand opnieuw begint.
5. Zou je ook een *running total* over alfabetisch gesorteerde producten kunnen maken?
