

In een eerder lab heb je de functie `strange quantity measure` geïmplementeerd. We gaan deze opnieuw implementeren met behulp van een iterator-functie.

We gebruiken daarbij het volgende vereisten:

* We kijken naar de hoeveelheid verkochte producten: `'Fact Sale'[Quantity]`
* Wanneer de cijfers waar we naar kijken over **blauwe** producten gaan, moeten de filter van `'Dimension Date'[Calendar Year]` verwijderd worden. De blauwe producten laten dus altijd de cijfers over alle jaren zien.
* Wanneer de cijfers waar we naar kijken over **grijze** producten gaan, moeten de cijfers van de **rode** producten weergegeven worden.
* In alle overige gevallen wordt de filter context intact gelaten

### Over welke tabel itereren we?

Wanneer je een iterator-functie inzet, moet je altijd bedenken over welke tabel je wilt itereren. Aangezien een *iterator-functie* een *row context* introduceert en we een uitsplitsing willen maken op *Color*, lijkt het logisch om over `'Dimension Stock Item'` te itereren. Een tweede kandidaat zou `'Fact Sale'` kunnen zijn (via `RELATED` kunnen we dan alsnog de kleuren uitlezen)

Een eerste zet zou daarom kunnen zijn: `strange quantity measure = SUMX('Dimension Stock Item'; 'Fact Sale'[Quantity])`. Dit werkt echter niet! Vanuit de *row context* binnen `'Dimension Stock Item'` gezien is er niet één item dat we direct kunnen ophalen uit de tabel `'Fact Sale'`. Dat is ook logisch: producten worden bij voorkeur meerdere keren verkocht.

De oplossing kan dus vooralsnog twee kanten op:

* We itereren over `'Fact Sale'`, en gebruiken `'RELATED'` om te kijken welke kleur er geselecteerd is. Daarmee kunnen we dan onze logica implementeren
* We itereren over `'Dimension Stock Item'`, en introduceren een nieuwe filter context 
hebben we geen directe toegang tot `'Fact Sale'[Quantity]`. En omdat er niet een één op 

* Bedenk goed over welke tabel je wilt gaan itereren en waarom.
* We kijken naar de hoeveelheid verkochte producten: `'Fact Sale'[Quantity]`
* Wanneer de cijfers waar we naar kijken over **blauwe** producten gaan, moeten de filter van `'Dimension Date'[Calendar Year]` verwijderd worden. De blauwe producten laten dus altijd de cijfers over alle jaren zien.
* Wanneer de cijfers waar we naar kijken over **grijze** producten gaan, moeten de cijfers van de **rode** producten weergegeven worden.
* In alle overige gevallen wordt de filter context intact gelaten
* Maak gebruik van de kennis die je inmiddels hebt over:
  * `SUMX`
  * `RELATED`
  * `IF` (en geneste IF statements)
  * `CALCULATE` in combinatie met `ALL`

Nog twee laatste tips:

* Begin klein. Bouw eerst een measure die eenvoudig `'Fact Sale'[Quantity]` optelt met een iterator, bouw daarna uit met één uitzondering (blauw of grijs). Pas wanneer dat werkt voeg je de tweede uitzondering toe.
* VAR statements gaan je hier niet helpen..


## Semi-additieve measures
