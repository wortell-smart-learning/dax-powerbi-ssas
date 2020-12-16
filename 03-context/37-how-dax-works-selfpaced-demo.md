# Context Transitie - self-paced demo

In deze *self-paced demo* gaan we nog even door op de twee contexten: *row context* en *filter context* - en met name de *Context Transitie*. Er volgen enkele demonstraties van toepassingen van deze context transitie.

## Context Transitie en semi-additieve measures

Stel dat je op zoek bent naar de **gemiddelde winst per klant**. Een `AVERAGE` over `'Fact Sale'[Profit]` uitsplitsen over klanten gaat je hier niet helpen, want dat geeft je de gemiddelde winst *per verkoop*. En per klant doe je (als het goed is) meerdere verkopen.

![Gemiddelde verkopen per klant - zo dus niet](img/37-04-gemiddelde-verkopen-per-klant-onjuist.png)

Hoe dan wel? Als volgt:

* We willen de gemiddelde winst per klant
* Anders gezegd: per klant willen we alle verkopen optellen. Vervolgens willen we daar het gemiddelde over nemen
* Nog anders gezegd: als we *itereren* over onze klanten, kunnen we vervolgens *per klant* de gemiddelde verkopen nemen

Nu zou je de volgende formule kunnen bedenken:

```dax
Semi-additieve measure poging 1 = AVERAGEX('Dimension Customer', SUM('Fact Sale'[Profit]))
```

In bovenstaande formule wordt over de tabel met klanten geïtereerd, wordt vervolgens per klant de som aan winsten berekend, en wordt daarna het gemiddelde genomen.

Wanneer je deze formule echter uitprobeert zie je dat dit niet helemaal werkt zoals verwacht - er wordt geen gemiddelde genomen over de totaalwinsten per klant:

![Uitkomst poging 1 semi-additieve measure](img/40-01-semi-additieve-measure-poging-1.png)

De oorzaak hier is het feit dat de `SUM` functie de *row context* niet snapt. En zonder die row context ziet `SUM` dus precies hetzelfde als wanneer de `AVERAGEX` hier niet had gestaan: de impliciete filter context van `Customer`, en wanneer die weg is (op de totaalrij) helemaal geen filter context meer.

We kunnen dit oplossen door **context transitie**: het expliciet aanmaken van een nieuwe filter context *binnen de rij-context*. Dat doen we door de `CALCULATE` functie om de `SUM` heen te zetten:

```dax
Gemiddelde winst per klant =
AVERAGEX ( 'Dimension Customer', CALCULATE ( SUM ( 'Fact Sale'[Profit] ) ) )
```

Nu komt de gemiddelde winst per klant er correct uit:

![Correcte uitkomst van semi-additieve measures](img/40-02-semi-additieve-measure-correct.png)

## Context Transitie en iterators

Je zult context transitie niet extreem vaak toepassen. Wanneer je echter gemiddelden per categorie wilt gebruiken (zoals in het voorbeeld hierboven), heb je ze vaak nodig.

Het is goed om in het achterhoofd te houden dat een context-transitie (plat gezegd: `CALCULATE` binnen een *iterator* als `SUMX`, `AVERAGEX`, e.d.) negatief kan zijn voor de prestaties van je datamodel. Laat dit je niet teveel tegenhouden, maar denk wel goed na of je zaken ook zónder context transitie kunt oplossen.

Zelfs wanneer je performance-problemen hebt én je gebruikt context-transitie, dan nog weet je niet zeker of dat ook de veroorzaker is van je probleem! Om zeker te weten waar de angel zit bij een performance-probleem, is verdere analyse nodig. Er zijn diverse video's en tools beschikbaar. In de volgende YouTube-filmpjes vind je daar een paar voorbeelden van:

* https://www.youtube.com/watch?v=eABg872TAJU
* https://www.youtube.com/watch?v=1lfeW9283vA
* https://www.youtube.com/watch?v=B-h3Pohtn1Y

Daarnaast is er nog een iets meer "deep dive" sessies (1 uur) uit 2013 over het Tabular Model met performance-tips die je hier kunt vinden:

* https://www.youtube.com/watch?v=dgzJPQ2-F5s
