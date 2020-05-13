# Context Transitie - self-paced demo

In deze *self-paced demo* gaan we nog even door op de twee contexten: *row context* en *filter context* - en met name de *Context Transitie*. Er volgen enkele demonstraties van toepassingen van deze context transitie.

De uitleg over context transitie staat (samen met een basale uitleg hoe DAX achter de schermen werkt) ook op video. Je kunt de video hieronder vinden:

[How DAX works en Context Transitie](./39-how-dax-works-video.html)

## Context Transitie en semi-additieve measures

Stel dat je op zoek bent naar de **gemiddelde winst per klant**. Een `AVERAGE` over `'Fact Sale'[Profit]` uitsplitsen over klanten gaat je hier niet helpen, want dat geeft je de gemiddelde winst *per verkoop*. En per klant doe je (als het goed is) meerdere verkopen.

![Gemiddelde verkopen per klant - zo dus niet](img/37-04-gemiddelde-verkopen-per-klant-onjuist.png)

Hoe dan wel? Als volgt:

* We willen de gemiddelde winst per klant
* Anders gezegd: per klant willen we alle verkopen optellen. Vervolgens willen we daar het gemiddelde over nemen
* Nog anders gezegd: als we *itereren* over onze klanten, kunnen we vervolgens *per klant* de gemiddelde verkopen nemen

Nu zou je de volgende formule kunnen bedenken:

```dax
Semi-additieve measure poging 1 = AVERAGEX('Dimension Customer'; SUM('Fact Sale'[Profit]))
```

In bovenstaande formule wordt over de tabel met klanten geïtereerd, wordt vervolgens per klant de som aan winsten berekend, en wordt daarna het gemiddelde genomen.

Wanneer je deze formule echter uitprobeert zie je dat dit niet helemaal werkt zoals verwacht - er wordt geen gemiddelde genomen over de totaalwinsten per klant:

![Uitkomst poging 1 semi-additieve measure](img/40-01-semi-additieve-measure-poging-1.png)

De oorzaak hier is het feit dat de `SUM` functie de *row context* niet snapt. En zonder die row context ziet `SUM` dus precies hetzelfde als wanneer de `AVERAGEX` hier niet had gestaan: de impliciete filter context van `Customer`, en wanneer die weg is (op de totaalrij) helemaal geen filter context meer.

We kunnen dit oplossen door **context transitie**: het expliciet aanmaken van een nieuwe filter context *binnen de rij-context*. Dat doen we door de `CALCULATE` functie om de `SUM` heen te zetten:

```dax
Gemiddelde winst per klant =
AVERAGEX ( 'Dimension Customer'; CALCULATE ( SUM ( 'Fact Sale'[Profit] ) ) )
```

Nu komt de gemiddelde winst per klant er correct uit:

![Correcte uitkomst van semi-additieve measures](img/40-02-semi-additieve-measure-correct.png)

## Context Transitie en iterators

Je zult context transitie vaak tegenkomen bij het toepassen van iterators - en vaak ontkom je er ook niet aan. Wel is het goed om te weten