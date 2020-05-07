# Demo: Functies, queries en categorieën

> In deze training zijn de demo's iets anders dan je normaal gesproken gewend bent: in plaats van een trainer die een demonstratie geeft, hebben we ervoor gekozen om de demonstratie uit te schrijven, waarna je de demonstratie feitelijk zelf geeft. Op die manier blijven sommige zaken zo beter hangen, en is er minder kans dat je iets mist. Bijkomend voordeel: je kunt de demonstratie er later eenvoudig weer eens bijpakken om iets te demonstreren of uit te leggen.

## Voorbereiding en scope

In deze demo gaan we kijken naar wat DAX eigenlijk is. We bekijken daarvoor naar twee zaken:

1. **Functies binnen DAX**. Zoals eerder uitgelegd heeft DAX acht verschillende functiecategorieën. We bekijken van alle categorieën één of meer voorbeelden van functies.
2. **DAX als query-taal**. We maken kennis met de tool **DAX Studio**, waarmee we DAX queries kunnen "afluisteren" van Power BI of Analysis Services, maar ook zelf DAX queries schrijven.

Er staat al een Power BI-bestand klaar waar we in deze demo mee zullen werken - het bestand heet `02-demo-functies-queries-categorieen`. Open dit bestand om met de demo aan de slag te kunnen

## Voorbeelden van functies

DAX heeft acht verschillende functiecategorieën:

* DateTime
* Filter
* Information
* Logical
* Math and trigonometry
* ParentChild
* Statistical
* Text

Om hier wat gevoel bij te krijgen zullen we van elke functie twee of drie voorbeelden bekijken van functies.

### DateTime

#### YEAR()

DateTime-functies kunnen je helpen om datums en tijden te verwerken. Stel dat je bijvoorbeeld de hoeveelheid verkochte producten per jaar wilt weergeven.

1. Uit de tabel **Order** selecteer je het veld **Order Date**. Op je canvas zie je nu een tabel met één kolom, waarin de datums staan waarop de producten verkocht zijn.
2. Sleep nu vanuit de tabel **Order** het veld **Quantity** op de lijst met datums.

De tabel laat nu de verkopen per dag zien, maar we willen graag de verkopen per *jaar*. Om dit te bereiken voegen we een **calculated column** toe.

3. In het paneel met **velden** aan de rechterkant van je scherm selecteer je de tabel **Order**.
4. In het lint (de ribbon) bovenin zie je dat je automatisch naar het kopje **Tabelhulpmiddelen** gebracht wordt. Hier heb je de mogelijkheid om een nieuwe kolom toe te voegen.
5. Klik op **Nieuwe kolom**. Onder het lint verschijnt de DAX-editor. De tekst `Kolom = ` staat weergegeven
6. Vervang deze tekst door `Order Year = YEAR([Order Date])`
7. Maak nu een tweede tabel, waarin je `Order Year` en `Quantity` naast elkaar zet.

Power BI zal standaard proberen elke numerieke waarde op te tellen (tenzij je in het model hebt aangegeven dat dit niet de bedoeling is). Zo ook `Order Year`. Gelukkig kun je dit vrij eenvoudig aanpassen: klik de tabel die je zojuist gemaakt hebt, en klik onder het kopje **Waarden** op het pijltje naast **Order Year**. Kies nu voor **Niet samenvatten**:

![Power BI instrueren om Order Year niet te aggregeren](img/02-01-order-year-dont-summarize.png)

> Naast de functie `YEAR` zijn er ook diverse soortgelijke functies die bijvoorbeeld maanden of dagen uit een datum ophalen. Een paar voorbeelden:
> 
> * **DAY** geeft het dagnummer binnen een maand (1-31)
> * **MONTH** geeft het maandnummer terug (1-12)
> * **YEAR** geeft het jaar terug
>
> Op dezelfde wijze kun je **QUARTER**, **WEEKDAY**, **HOUR**, **MINUTE** en **SECOND** gebruiken. Er is ook een **WEEKNUM** functie, maar let daar even goed op de weeknummering: in Europa gebruiken we een andere weeknummering dan in de V.S.!)

#### DATEDIFF en EOMONTH

Stel nu dat we voor elke datum zouden willen berekenen hoeveel dagen er nog over zijn tot het einde van de maand. Dat vereist twee stappen:

* We moeten weten wanneer het einde van de maand is (iets dat in februari niet heel eenvoudig is)
* We moeten uitrekenen hoeveel dagen er tussen een gegeven datum en de laatste datum binnen de maand zitten

Gelukkig heeft DAX een functie aan boord om ons te helpen met het eerste probleem. De functie **EOMONTH** vertelt ons altijd wat het einde van de maand is.

8. Maak een **Nieuwe kolom** in de tabel **Order**. Geef deze de definitie `End of Order Month = EOMONTH([Order Date], 0)`.
9. Voeg deze kolom toe aan de tabel waarin je `Order Date` tegen `Quantity` had uitgezet (dus de allereerste tabel).
10. Je ziet nu voor elke weergegeven `Order Date` wat de laatste dag is in de betreffende maand:

![Demonstratie van EOMONTH](img/02-02-eomonth.png)

> Zoals je ziet heeft de EOMONTH-functie twee argumenten: de datum, en een `0`. Het tweede argument verteld hoeveel maanden je vooruit wilt kijken. Dit geeft je de mogelijkheid om niet alleen de laatste dag van de huidige maand te bekijken, maar ook de laatste dag van de volgende maand (`EOMONTH([Order Date], 1)`).

11. Maak een **Nieuwe kolom** in de tabel **Order**. Geef deze de definitie `Days until end of Order Month = DATEDIFF([Order Date], [End of Order Month], DAY)`.
12. Voeg deze kolom toe aan de tabel waarin je zojuist ook `End of Order Month` hebt toegevoegd.
13. Omdat `Days until end of Order Month` opnieuw een numerieke waarde is, zal Power BI deze proberen te aggregeren. Zorg ervoor dat dit niet meer gebeurt.
14. Herschik de kolommen zodat `Quantity` als laatste kolom wordt weergegeven.

Je ziet nu voor elke orderdatum hoeveel er besteld is, evenals hoeveel dagen er nog over zijn in de maand.

### Filter

Filter functies zijn één van de meer complexe functies binnen Power BI. Om de demonstratie niet te diepgaand te laten zijn (we gaan later uitgebreid in op filters en wijden er zelfs een hele module aan) volgt hier een kort voorbeeld. We willen hierin een analyse doen van de betaalde belasting per kleur van het product dat we verkochten:

15. Maak een nieuw tabblad aan, geef deze de naam **Filter**
16. Sleep uit de tabel **Stock Item** het veld **Color** op het canvas. 

Op het canvas verschijnt nu een tabel met één kolom. Daarin staan de kleuren van de verkochte producten.

17. Sleep uit de tabel **Sale** het veld **Tax Amount** bovenop de zojuist aangemaakte tabel.

De tabel geeft nu per productkleur aan hoeveel belasting hiervoor betaald is. Wanneer je dat iets technischer uitdrukt, zou je kunnen stellen dat de tabel **Sale** *gefilterd* wordt op elke kleur (Black, Blue, Gray, ...) en dat er in de kolom **Tax Amount** vervolgens alleen een optelling van de rijen van die kleur wordt gedaan.

Met de functie **ALL** kunnen we de filters van een tabel vervolgens verwijderen:

18. In het paneel met **velden** aan de rechterkant van je scherm selecteer je de tabel **Sale**.
19. In het lint (de ribbon) bovenin zie je dat je automatisch naar het kopje **Tabelhulpmiddelen** gebracht wordt. Hier heb je de mogelijkheid om een nieuwe meting (measure) toe te voegen. 
20. Klik op de knop **Nieuwe meting**
21. Vervang de tekst `Meting =` door de DAX-formule `All Tax Amount = CALCULATE(SUM([Tax Amount]); ALL('Order'))`
22. Voeg de kolom `All Tax Amount` toe aan de tabel met `Color` en `Tax Amount`.

Je hebt nu een tabel waarin op elke rij de betaalde belasting voor een kleur wordt weergegeven, evenals het totaal aan betaalde belasting. De functie `ALL` heeft er hier voor gezorgd dat de "filter" op kleur verwijderd werd.

![Betaalde belasting en alle belasting per kleur in één tabel weergegeven](img/02-03-color-alltaxamt.png)

> Zoals hierboven gesteld zijn filter functies de meer complexe functies binnen Power BI. Tegelijkertijd zijn ze de crux tot écht krachtige Power BI modellen en uitgebreide measures. Wanneer je de zaken hierboven slechts globaal volgde, is dat geen probleem - we komen hier later nog uitgebreider op terug.

### Information

De categorie **information** omvat functies die je kunnen vertellen over de inhoud van een kolom, of soms zelfs van het systeem waar de klant momenteel mee werkt. Een voorbeeld is de functie **ISNUMBER**:

23. Maak een nieuw tabblad aan, hernoem deze naar **Information & Logical**
24. Sleep uit de tabel **Customer** de kolom **Postal Code** op het canvas. 

Een tabel verschijnt met één kolom. Daarin vind je de waarden van het veld **Postal Code**.

25. Klik de tabel **Customer** aan, en maak een nieuwe kolom. Geef deze de volgende DAX-definitie: `Postal Code is Number = ISNUMBER([Postal Code])`
26. Sleep het nieuwe veld **Postal Code Is Number** bovenop de bestaande tabel

Je krijgt nu te zien of de waarden in de kolom **Postal Code** getallen zijn. *Volgens DAX zijn ze dat dus niet!* De reden is dat de getallen hier als tekst zijn opgeslagen.

27. Maak in de tabel **Customer** nu een tweede nieuwe kolom aan, met de DAX-definitie `Customer Key is Number = ISNUMBER([Customer Key])`.
28. Sleep nu zowel het veld **Customer Key** als het veld **Customer Key is Number** op de tabel.

![ISNUMBER demonstratie](img/02-03-isnumber.png)

Het veld **Customer Key** is wel numeriek opgeslagen, en wordt ook zo weergegeven door **ISNUMBER**. **ISNUMBER** vertelt nu *informatie* over het *datatype* van een kolom.

### Logical

Het antwoord op de **ISNUMBER** uitvraag die we zojuist deden, is het antwoord waar (true) of onwaar (false). Dit worden ook wel "logische" antwoorden genoemd. De categorie functies die hiermee kan werken heten dan ook *logische* functies.

Voor deze demonstratie doen we een eenvoudig voorbeeld: wanneer de kolom **Customer Key** numeriek is, willen we namelijk niet de tekst **Waar** zien, maar de tekst **Deze kolom is numeriek**.

#### IF

29. Klik in de lijst met velden op de naam van het veld **Customer Key Is Number**. (Let op dat je niet op het selectievakje klikt - dan wordt er een veld toegevoegd aan je rapport!)

De DAX editor opent, met daarin de functie `Customer Key is Number = ISNUMBER([Customer Key])`.

30. Breid deze functie uit met een `IF` functie, zodat de DAX-definitie van deze kolom er als volgt uitziet: `Customer Key is Number = IF(ISNUMBER([Customer Key]); "Deze kolom is numeriek"; "Deze kolom is niet numeriek")`
31. Doe nu hetzelfde voor de kolom `Postal Code is Number`, zodat de DAX-definitie is `Postal Code is Number = IF(ISNUMBER([Postal Code]); "Deze kolom is numeriek"; "Deze kolom is niet numeriek")`

Zoals je ziet in de resultaten kun je met **IF** logica inbouwen om je rapport slimmer, mooier of beter te laten functioneren.

### Math and trigonometry

In de categorie **Math and trigonometry** zitten allerhande wiskundige functies. Daaronder ook de handige functies om af te ronden: `CEILING`

32. Maak een nieuw tabblad aan met de naam **Math & Trig**
33. Sleep het veld **Tax Amount** naar het canvas, en verander de visualisatie in een **tabel**
34. Maak in de tabel **Sale** een nieuwe **meting** (*measure*) met de definitie: `Tax Amount Ceiled = CEILING(SUM([Tax Amount]); 1)`
35. Sleep deze nieuwe meting naar de tabel, zodat er een nieuwe kolom naast *Tax Amount* komt.

![CEILING rondt af naar boven](img/02-04-ceiling.png)

Zoals je hierboven gezien hebt, rondt `CEILING` altijd af naar boven. Het tweede argument is de *veelvoud* waar deze naar afrondt. Probeer deze maar eens uit met de volgende waarden:

* 10
* 1000

### ParentChild

**ParentChild**-functies zijn specifiek bedoeld voor hiërarchiën binnen DAX. Hier hebben we (nu) geen demo van opgenomen omwille van de tijd: hoewel niet bijzonder complex, is het wel een apart onderwerp dat niet heel veel helpt bij het beter begrijpen van de rest van DAX.

### Statistical

Onder het kopje "statistische functies" verstaat DAX niet alleen statistieken als **MAX**, **SUM**, **STDEV.P** en **STDEV.S**. Ook de functies waarmee tabellen gegenereerd kunnen worden vallen onder deze categorie.

In de cursus zullen we niet heel uitvoerig stilstaan bij deze categorie aan functies, maar ze zijn wel bijzonder nuttig! Daarom lichten we er in deze demo er drie uit:

* CROSSJOIN
* SAMPLE

#### CROSSJOIN

36. Schakel binnen Power BI naar de **Gegevens-weergave**
37. In het **Lint**, klik op **Nieuwe Tabel**
38. Geef deze tabel de volgende definitie: `CrossJoin Voorbeeld = VALUES('Stock Item'[Color])`. Bekijk de resultaten.

![Voorbeeld van VALUES](img/02-05-values.png)

De functie **VALUES** die we hier gebruiken is geen *statistical*, maar een *filter* functie. Deze geeft een tabel met één kolom terug, en daarin alleen unieke waarden. Dat zijn er dus maar 9, terwijl in de onderliggende tabel *stock item* 672 rijen aanwezig waren. Dat is wel zo handig voor wanneer we nu met **CROSSJOIN** verder gaan:

39. Verander nu de definitie van de tabel naar `CrossJoin Voorbeeld = CROSSJOIN(VALUES('Stock Item'[Color]); City)`

De functie **CROSSJOIN** doet letterlijk wat de naam impliceert: hij maakt een "cross join" tussen twee tabellen: voor elke rij uit de eerste tabel worden alle rijen uit de tweede tabel toegevoegd.

Aangezien de eerste tabel de *VALUES*-expressie is (met 9 rijen) en de tweede de volledige tabel City (met 116.295 rijen) levert dit een totaal op van **1.046.655 rijen**! Toch is het formaat voor een DAX datamodel niet bezwaarlijk: binnen enkele seconden was de tabel gevuld.

Sla het bestand nu op, en kijk naar het formaat - je zult zien dat het alles meevalt.

#### SAMPLE

40. Maak opnieuw een nieuwe tabel. Geef deze de volgende DAX-expressie: `Sample-voorbeeld = SAMPLE(1000; 'CrossJoin Voorbeeld'; [City])`

De functie `SAMPLE` kan een steekproef nemen uit een bestaande tabel. Dat kan helpen om bijvoorbeeld op een kleinere set data nieuwe berekeningen uit te testen, zonder de (soms gigantische) onderliggende datasets aan te hoeven spreken.

### Text

De laatste functiecategorie is **Text**. Hier kun je eenvoudig met teksten werken. De meeste van deze functies spreken voor zich - in de demo gebruiken we de functie **SUBSTITUTE** om een tekst te wijzigen.

41. In de **gegevens-weergave** van Power BI open je de tabel **City**. 

De kolom **Sales Territory** bevat hier de waarden **Southeast** en **Southwest**. In de richtlijnen van het bedrijf moet dit echter *South East* en *South West* zijn. Dat gaan we aanpassen.

> Uiteraard kun je dit beter structureel oplossen in een ETL- en/of datakwaliteitsstap. Je bent echter nu een dashboard aan het finetunen bent voor een presentatie, en wilt liever de data niet verversen.

42. Voeg een nieuwe kolom toe aan de tabel **City**. Geef deze de volgende definitie:

```DAX
Sales Territory Corrected = SUBSTITUTE([Sales Territory], "South", "South ")
```

### Acht of tien functiecategorieën?

Eerder stelden we dat er acht functiecategorieën zijn in DAX. DAX onderscheidt echter nog een negende en zelfs een tiende functiecategorie, die we hier niet bespreken. Om je toch een idee te geven nemen we ze hier op:

#### Time-intelligence functies

Hoewel deze strikt gezien ook onder **Date & Time** zouden kunnen vallen, zijn deze functies vaak iets ingewikkelder. Voor een goed overzicht is er daarom in de documentatie voor gekozen om ze te scheiden. Gebruikers die in het lijstje met datum-functies `EOMONTH` tegenkomen, worden dan niet in de war gebracht met de "time intelligence" functie `ENDOFMONTH`.

De Time Intelligence functies voeren voor nu te diep - verderop in de cursus zullen we deze echter zeker behandelen!

#### Other functions

DAX kent nog een laatste categorie: "other functions". Hierin zitten enkele erg nuttige functies. Probeer de volgende functies maar eens toe te voegen als **calculated table**:

* **GENERATESERIES** geeft een tabel van één kolom met daarin oplopende getallen:

```dax
Generate Series voorbeeld = GENERATESERIES(1; 5000)
```

* DAX kent een inline **table constructor** die het erg eenvoudig maakt om een nieuwe tabel handmatig in te vullen

```dax
Table constructor voorbeeld = {1; 2; 3}
```

## DAX als Query-taal