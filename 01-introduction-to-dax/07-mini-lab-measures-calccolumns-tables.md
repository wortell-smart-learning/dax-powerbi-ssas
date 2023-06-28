# Measures, calculated columns, and tables

In the previous demo, we looked at how DAX works. We have already encountered various **measures**, **calculated columns**, and **tables**. In this exercise, we will dive deeper into these concepts.

## Calculated Measures

1. Open the file `07-mini-lab-measures-calccolumns-tables-start`.
2. Drag the column **Total including Tax** onto the canvas.
3. Add the **Calendar Year** column to the axis of the chart to display *Total Including Tax per Calendar Year*. Your chart should now look like this:

![Total Including Tax by Calendar Year](img/01-total-including-tax-by-calendar-year.png)

You have just used an *implicit measure*: Power BI automatically generates the necessary DAX query for *Total including Tax* to behave as a measure.

4. Now, create an **explicit measure** named **Sum of Total Including Tax**. It should work the same way as the implicit measure you have seen so far. You can use the `SUM` formula for this.

## Calculated Columns

Within the **Dimension Customer**, there is a column **Primary Contact** (containing the name of a contact person) and a column **Customer** (containing the company name). Our client wants one column that combines both values in a specific text format. It should look like this:

![Contact and customer name example](img/02-contact-customer-name-example.png)

5. Create a new calculated column to achieve this.
   * To enter text directly, use double quotes `"`
   * To concatenate two text values, use the ampersand symbol: `&`
   
Your client also wants a column named `special size` in the `Dimension Stock Item` table. This column should display the text "EXTRA LARGE" when the `size` column has the value "XL". For all other sizes (including `N/A`), it should display the text "small".
   * Use the `IF` function for this
   * Feel free to ask for assistance!

![Example of the special size column](img/03-special-size-column.png)

For the next task, you will need a so-called **nested** IF function. This means that you can use one IF statement *within another IF statement*. Here's a small example of how it can work - it might be helpful to start with this and then break down the task into smaller steps:

```dax
IF([Size] = "L", "Large", IF([Size] = "XL", "Extra Large", "Others"))
```

6. Add a column named `extended size` within the `Dimension Stock Item` table.
   * If `Size` is equal to `XL`, the column should display "Extra Large"
   * If `Size` is equal to `L`, the column should display "Large"
   * For all other cases, the column should display "Other"

If you're up for more challenge, we can make this task a bit more difficult. For the next task, you will need logical operators (this is a bonus task - if you can't solve it, we will quickly move on to using these operators):

7. Add a column named `special tax size` within the `Dimension Stock Item` table. The values should be as follows:
   * "Large, High Tax" when 'size' is equal to "L" or "XL" and 'Tax Rate' is greater than 10
   * "Large, Low Tax" when 'size' is equal to "L" or "XL" and 'Tax Rate' is less than or equal to 10
   * "Other" for all other cases.

![Extra columns](img/04-extracolumns.png)

## Calculated Table

You can use the `FILTER` function to filter a table. The results will be returned as a new table that only contains the filtered content. Here's an example of a **Calculated Table** that includes only the dates from 2016:

```dax
Dates2 = FILTER(Dates, 'Dates'[Calendar Year] = 2016)
```

8. Create a Calculated Table named `Medium-Small Stock Items`. It should be a filtered version of `Dimension Stock Item`, including only products with size `S` and `M`.