# Demo - ALL, ALLEXCEPT, and ALLSELECTED

In this self-paced demo, we will explore different uses of the `ALL` operator. We will do this with a simple table, which you can find below and in the Power BI file `53-guided-demo-allexcept-allselected.pbix`.

| ColumnA | ColumnB | ColumnC   | ColumnD   | ColumnE |
|---------|---------|-----------|-----------|---------|
| A       | Apple   | Australia | Athletics | 10      |
| B       | Banana  | Brazil    | Athletics | 15      |
| C       | Cherry  | Canada    | Cricket   | 30      |

## Preparation

Open the file `53-guided-demo-allexcept-allselected`.

## ALL

We have already used the `ALL` function before. Now, using what we have just learned about filters and the `FILTER` function, we will revisit the `ALL` function. We will also use our existing knowledge of the `ALL` function to create a measure that we can compare with `ALLEXCEPT` and `ALLSELECTED`.

1. Create a table with all the columns from *Table1* side by side.  
![Source table view](img/53-01-alle-kolommen.png)
2. Open [DAX Formatter](https://www.daxformatter.com/) and format the following measure definition:  
`ALL Measure = CALCULATE(SUM(Table1[ColumnE]), ALL(Table1[ColumnA], Table1[ColumnB], Table1[ColumnC]))`
3. Enter the now properly formatted measure definition in the Power BI model.
4. Create a **Table visualization** and add the following fields to it:
   * **ColumnA**
   * **ColumnB**
   * **ColumnC**
   * **ALL Measure**
5. **Copy and paste** the table visualization. **Add ColumnD**. The second table visualization should now have the following fields:
   * **ColumnA**
   * **ColumnB**
   * **ColumnC**
   * **ColumnD**
   * **ALL Measure**
6. Compare the three tables (the table with source data vs. the two tables with an `ALL` measure). Is the result as expected?  
![Result of steps 1-6](img/53-01-compare-three-tables.png)

> ### What does the filter context look like?
>
> Even if you find the above tables completely logical, it is still useful to explicitly state what is happening here.
> In this case, `ALL` removes the filters from columns A through C, but D remains. This results in the following outcomes:
>
> * In the image above, the table **bottom left** contains columns *ColumnA*, *ColumnB*, and *ColumnC*. In other words, the filter context for the first row consists of:
>   * ColumnA = "A"
>   * ColumnB = "Apple"
>   * ColumnC = "Australia"
> * These are exactly the columns that the `ALL Measure` removes filters from with the `ALL` function. **In that sense, `ALL` does the exact opposite of `FILTER`: `FILTER` adds filters, `ALL` removes them.**
> * In the image above, the table **bottom right** also includes the column *ColumnD*. The `ALL measure` does not remove any filters from it, so they remain intact.
>   * **Although the table has three rows, the filter context for the `SUM` function within the `ALL Measure` only has one filter: the filter on `ColumnD`.**
>   * In row 1, the filter context for `SUM` consists of one filter: `ColumnD = "Athletics"`
>     * All values where this is true are added together: 10 + 15 = 25
>   * The same happens in row 2 as in row 1.
>   * In row 3, the filter context for `SUM` also consists of one filter: `ColumnD = "Cricket"`
>     * There is only one value for Cricket: 30
>   * In row 4 (*Total*), the filter context for `SUM` is empty.
>     * There is no filter on `ColumnD` in the total row (nor on the other columns)
>     * All values in column `Table1[ColumnE]` are therefore summed: 10 + 15 + 30 = 55

## ALLEXCEPT

The function **ALL** removes all implicit filters from the columns that you explicitly name: `ALL(Table1[ColumnA])` removes all implicit filters from `Table1[ColumnA]`. The function **ALLEXCEPT**, on the other hand, removes filters from columns that you *do not* explicitly name. Therefore, you must specify both a table and at least one column.

7. Create a new measure `ALLEXCEPT measure` with the following definition:
   * `ALLEXCEPT Measure = CALCULATE ( SUM ( 'Table1'[ColumnE] ), ALLEXCEPT ( Table1, Table1[ColumnD] ) )`
8. Add the new measure to both tables (the table without ColumnD and the table with ColumnD). As you can see, they function exactly the same.

`ALLEXCEPT` is technically an unnecessary function: anything you can do with `ALLEXCEPT`, you can also do with `ALL`. However, it greatly improves the readability of your calculated measure.
The function **ALL** removes all implicit filters - basically making rows available that you would not have been able to see otherwise. As you have seen before, this helps, for example, in displaying percentages of the whole.

The function **ALLSELECTED** does the same thing - but with one big difference: **`ALLSELECTED` removes only the implicit filters that are active __within__ the query.** Let's explore what this looks like:

9. Create three new measures in the table `'Fact Sale'`:
   * `Sum of Quantity = SUM('Fact Sale'[Quantity])`
   * `ALL Quantity = CALCULATE( SUM('Fact Sale'[Quantity]), ALL('Fact Sale') )`
   * `ALLSELECTED Quantity = CALCULATE( SUM('Fact Sale'[Quantity]), ALLSELECTED('Fact Sale') )`
10. Create a table visualization with the field `'Dimension Date'[Calendar Year]` and the three measures just created:

![At first glance, ALLSELECTED appears to do the same as ALL](img/53-10-allselected-niksnieuws.png)

As you can see, the three measures react as follows to the breakdown by `'Dimension Date'[Calendar Year]`:
* `Sum of Quantity` keeps the filter context intact: therefore, only the values from `[Quantity]` where `'Dimension Date'[Calendar Year] = 2013]` are displayed on row 1.
  * `'Dimension Date'[Calendar Year]` filters all rows in `'Dimension Date'`. The column `'Dimension Date'[Date]` is also filtered.
  * `'Dimension Date'[Date]` has a relationship with `'Fact Sale'[Invoice Date Key]`.
  * Due to the relationship between `'Dimension Date'` and `'Fact Sale'`, the rows from `'Fact Sale'` are filtered.
  * As a result, the `SUM('Fact Sale'[Quantity])` is different for 2013 than for 2014.
* `ALL Quantity` removes all implicit filters from the filter context. It displays the total of 8950628 on all rows: there are no filters left in the filter context.
* In this example, `ALLSELECTED Quantity` does the same as `ALL Quantity`.

At first glance, there is no difference between `ALL` and `ALLSELECTED`. There is a reason for that: **the measures we are currently looking at only have filters in their filter context that are derived from their own query**. In other words, all filtering is done from the own *visual* in Power BI.

11. Now add a slicer to the report on the column `'Dimension Stock Item'[Buying Package]`. Select the value **each**.
    * You will see that the `ALL Quantity` measure remains unchanged. This is logical: all implicit filters are removed.
    * However, `ALLSELECTED Quantity` still retains a filter: the filter `'Dimension Stock Item'[Buying Package] = "Each"`.
You can see that all three measures react differently:

* `Sum of Quantity` preserves the filter context: row 1 only displays values from `[Quantity]` where `'Dimension Date'[Calendar Year] = 2013` and `'Dimension Stock Item'[Buying Package] = "Each"`
* `ALL Quantity` removes all implicit filters from the filter context. Although we added an external filter (the slicer on `'Dimension Stock Item'[Buying Package]`), it is removed by the `ALL` function.
* `ALLSELECTED` only removes filters **within the query** (for Power BI: **within the *visual***).
  * The filter of `'Dimension Date'[Calendar Year]` is removed for the calculation of `SUM('Fact Order'[Quantity])` within this measure.
  * However, the filter of `'Dimension Stock Item'[Buying Package]` is preserved!
  
In essence, **`ALLSELECTED`** does the same thing as the **total row** at the bottom of `Sum of Quantity`: it removes the filters from *within* the visual, but keeps the ones from *outside* the visual. This is why we see the same outcome here:

![ALLSELECTED does the same as the total row](img/53-11-allselected-hetzelfde-als-totaalrij.png)
