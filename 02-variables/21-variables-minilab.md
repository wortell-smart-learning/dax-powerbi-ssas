# Variables

## Preparation

Open the Power BI file `21-variables`. In this file, you will find a variation of the "Donderdagochtendgroet" measure that you developed earlier (functionally, it is the same, but now all the logic is incorporated into one measure).

## Variables for clarity

The `Donderdagochtendgroet` measure is currently one big measure. This often happens when you are working intensively on a piece of DAX: while you are working on it, all the nuances are in your head, but when you look back later, the code is suddenly more complex than you remember.

```dax
De Donderdagochtendgroet = IF(HOUR(NOW()) >= 12 && WEEKDAY(TODAY()) = 5, "Het is donderdagmiddag!!", IF(HOUR(NOW()) < 12, "Goedemorgen", "Goedemiddag") & ", " & USERPRINCIPALNAME())
```

As a first step, let's give the measure some structure.

1. **Copy the definition** of the measure.
2. Open a web browser and **navigate to [https://www.daxformatter.com/](https://www.daxformatter.com/)**.
3. **Paste** the measure **into the gray box** at the top of the website.
4. Click on **Format**.
5. Click on **Copy**.
6. Replace the `Donderdagochtendgroet` measure in Power BI with the - now slightly better formatted - measure text from DAX Formatter.

Now, let's add variables to make the measure even clearer. Actually, there are two pieces of logic that could be simplified:

* Checking if it is morning using `HOUR(NOW()) < 12`
* Checking if it is Thursday using `WEEKDAY(TODAY()) = 5`

7. Within Power BI, add a new line after the text `De Donderdagochtendgroet =` in the measure definition by using **shift+enter**.
8. On this line, write `VAR HetIsDonderdag = WEEKDAY(TODAY()) = 5`.
9. On the third line (just before `IF`), write `RETURN`.

The measure now looks like this:

![First step with VAR and RETURN](img/20-01-var-return-introductie.png)

10. Verify that the measure still works.
11. Replace the DAX expression `WEEKDAY(TODAY()) = 5` with the variable `HetIsDonderdag` on line 5.
12. Now, add a variable `HetIsOchtend`, and replace the definition `HOUR(NOW()) < 12` with this variable.
13. Do the same with a variable `HetIsMiddag` - this one replaces the definition `HOUR(NOW()) >= 12`.
14. Test if your measure still works and use DAX Formatter to format it.

Your measure now looks like this:

```dax
De Donderdagochtendgroet =
VAR HetIsDonderdag =
    WEEKDAY(TODAY()) = 5
VAR HetIsOchtend =
    HOUR(NOW()) < 12
VAR HetIsMiddag =
    HOUR(NOW()) >= 12
RETURN
    IF(
        HetIsMiddag && HetIsDonderdag,
        "Het is donderdagmiddag!!",
        IF(HetIsOchtend, "Goedemorgen", "Goedemiddag") & ", "
            & USERPRINCIPALNAME()
    )
```

15. Can you make any further improvements to make the measure more readable or simpler?

## Try it yourself with variables

Now, try to complete the following tasks using variables and the VAR keyword.

16. Create a new measure named `TweePlusTweeMeasure`.
    * Include a variable named `Twee` with a value of `2` within the measure.
    * The result of the measure should be the sum of this variable with itself.
    * Create a column chart that plots this measure against *Calendar Year*.
      * What result do you expect?
      * Does it match the result you expected?
17. Now, create a calculated column named `TweePlusTweeColumn` in the `Dimension Date` table with the same definition as `TweePlusTweeMeasure`.
    * Create another column chart that plots this calculated column against *Calendar Year*. Compare the results to the previous task and explain what is happening behind the scenes:
      * Why do you get the numbers you see?
      * What does Power BI calculate behind the scenes?
      * Does the number look familiar?
      * What happens if you change the aggregation method to, for example, sum? Can you still explain the numbers?
18. Create a measure named `VreemdeBelasting`. This tax is included in the `'Fact Sale'[Tax Amount]` for even years (2010, 2012, 2014), but for *odd years* (2011, 2013, ...), it is calculated by taking 25% of the *profit*.
    * For even years, use the **SUM** of `'Fact Sale'[Tax Amount]`.
    * For odd years, take 25% of the **SUM** of `'Fact Sale'[Profit]`.
    * Use the `ISEVEN` function.
    * Use variables to store intermediate calculations.
    * Within a measure, you cannot directly use the value of a single year. To solve this, as the first step, store the current selected year in a variable. You can do this with the definition `VAR GeselecteerdJaar = MAX('Dimension Date'[Calendar Year])`. Use this variable when you want to know or compare the current year.
    * Make sure the measure has the **Fact Sale** table as the home table.
    * Check your results with a matrix visual. The correct outcome is shown below.

![Correct outcome of the "vreemde belasting" task](img/20-02-correcte-uitkomst-vreemdebelasting.png)