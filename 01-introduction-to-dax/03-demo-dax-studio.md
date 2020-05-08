# Demo - DAX als Query-taal

DAX is behalve definitie-taal (waarin je de definitie van een kolom, measure of tabel vastlegt in een formule) ook een *querytaal*. Wanneer je data opslaat in een DAX datamodel (dus in Analysis Services Tabular, Power Pivot of Power BI), is dit ook de manier die front-end tools als Power BI gebruiken om met het datamodel te communiceren.

In deze demonstratie krijg je hier een korte introductie van te zien, door te werken met DAX Studio. DAX Studio is een gratis tool om DAX queries mee te kunnen uitvoeren.

Op de cursus-VM is DAX studio al geïnstalleerd. Je kunt de tool echter altijd gratis downloden vanaf [https://daxstudio.org](https://daxstudio.org/).

In deze korte demo zullen we drie dingen doen:

* We openen DAX studio
* We bevragen zelf het Power BI DAX datamodel

0. Zorg ervoor dat het Power BI demobestand uit de vorige demonstratie geopend is.
1. Zoek in het startmenu naar DAX studio. Start het programma.
2. Kies er in het welkomstscherm voor om verbinding te maken met het Power BI model `02-demo-functies-queries-categorieen` en kies **Connect**

![Startscherm van DAX studio](img/02-06-dax-studio-start.png)

3. Voer de volgende query uit:

```dax
EVALUATE 'Customer'
```

Onderaan het scherm verschijnen nu de resultaten van deze query.

4. Verander de query als volgt, en bekijk de resultaten:

```dax
EVALUATE VALUES('Stock Item'[Color])
```

Na het keyword **Evaluate** kun je eigenlijk elke tabel-expressie die maar mogelijk is invoeren in een DAX-query. Alle voorbeelden uit de vorige demonstratie waar een *Calculated Table* werd gedefinieerd door DAX, zou je dus kunnen gebruiken!

DAX Studio heeft nog veel meer zaken aan boord die erg handig kunnen zijn. Klik gerust rond in DAX studio - je kunt niets stukmaken!
