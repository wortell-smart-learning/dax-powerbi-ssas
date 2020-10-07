# Minilab - inactieve relaties, sort by column, automatic date table

## Inactieve relaties

Binnen Power BI kunnen er meerdere relaties bestaan tussen twee tabellen. Vaak is dit het geval bij een Datum-dimensie.

1. Maak een nieuwe measure `Count of Invoice Rows`, waarin je het aantal rijen binnen `Sale` telt
1. Visualiseer deze measure per `Date[Calendar Year]`
   * Welke relatie wordt op de achtergrond door DAX gebruikt?
1. Maak een tweede measure `Count of Delivery Rows`. Deze moet opnieuw het aantal rijen binnen `Sale` tellen, maar deze keer gebruik maken van de relatie van `Date[Date]` naar `Sale[Delivery Date Key]`.
   * Je kunt dit doen met behulp van de functie `USERELATIONSHIP`
   * Documentatie en voorbeelden zijn veelvuldig te vinden op internet :)

## Alternatief: meerdere date tables
 
Het nadeel van het gebruik van meerdere relaties, is dat binnen een measure aangegeven moet worden welke relatie er gebruikt moet worden.

Een alternatief is om een datumtabel simpelweg meerdere keren in te laden. In plaats van een tabel `Date` krijg je dan een tabel `Delivery Date`, een tabel `Invoice Date`, etc..

4. Maak een nieuwe *calculated table* met de naam `Delivery Date`. De inhoud mag exact hetzelfde zijn als de tabel `Date`
4. Doe ditzelfde voor een nieuwe tabel `Invoice Date`
4. Maak relaties aan tussen `Sale` en de nieuwe tabellen

Een nadeel van deze aanpak is dat niet alles aan een *Order*, danwel *Invoice* date opgehangen kan worden. Je kunt dit deels ondervangen door beide tabellen met een relatie te koppelen aan de oorspronkelijke `Date` tabel.

7. Verwijder de oorspronkelijke relaties tussen `Sale` en `Date`
7. Voeg nieuwe relaties toe tussen de nieuwe tabellen (`Invoice Date` en `Delivery Date`) en `Date`.
7. Zoals je ziet zal ook nu slechts één van de relaties als **active** aangemerkt zijn. Zorg ervoor dat dit `Invoice Date` is.
7. Verander de relaties van `1:1` naar `1:n` (waarbij `Date` de `1`-zijde is)
7. Pas de measure `Count of Delivery Rows` aan zodat deze weer correct werkt.

> ### 1:n
> 
> Het aanpassen van de `1:1` relatie zojuist was voor het datamodel strikt gezien niet nodig: de datum is aan beide zijden van de relatie uniek. Wanneer er echter een `1:1` relatie is, werkt `USERELATIONSHIP` niet helemaal zoals je zou verwachten. De laatste stap (het aanpassen van `Count of Delivery Rows`) was je dan niet gelukt.
> 
> Over het algemeen wordt de aanpak van zowel *role playing* dimensions (`Invoice Date`, `Delivery Date`) als een gezamenlijke dimensie (`Date`) niet vaak toegepast. Je kunt er in je model dan wel meer zaken in kwijt, maar het wordt er niet bepaald begrijpelijker op - met name voor een eindgebruiker.
