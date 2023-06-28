# Row Context in Iterator Functions

Open the Power BI file `35-row-context-iterators-minilab`.

1. In the *Fact Sale* table, create a measure called `Sum of Profit Per Item`, defined as `SUM('Fact Sale'[Profit] / 'Fact Sale'[Quantity])`
   * Explain why this does not work
   * Use the *iterator function* `SUMX` to make it work.
2. In the *Fact Sale* table, create a calculated column named *Typical Weight per Unit*. Fill it with the value from the column `Typical Weight per Unit` in the table `Dimension Stock Item`.
3. In the *Fact Sale* table, create a measure called `Amount`, defined as the sum of `'Fact Sale'[Quantity]` multiplied by `Dimension Stock Item[Unit Price]`.
4. Implement the measure *Y-Profits* using an *iterator* function:
   * If the selected city starts with a **Y**, return the `'Fact Sale'[Profit]`
   * Otherwise, return `BLANK()`
   * Consider beforehand on which table you want to iterate and why. If you can't figure it out, ask for help!
5. Create a new measure named `Net Profit`
   * If the *Size* of a product is equal to *S*, the value should be `'Fact Sale'[Quantity] * 'Dimension Stock Item'[Recommended Retail Price]`
   * Otherwise, subtract (`'Dimension Stock Item'[Unit Price]`) from the result.
