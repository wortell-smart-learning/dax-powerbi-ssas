# Minilab - Inactive relationships, sort by column, automatic date table

## Inactive relationships

Within Power BI, multiple relationships can exist between two tables. This is often the case with a Date dimension.

1. Create a new measure `Count of Invoice Rows` that counts the number of rows within `Sale`.
1. Visualize this measure by `Date[Calendar Year]`.
   * Which relationship is being used by DAX in the background?
1. Create a second measure `Count of Delivery Rows`. This should again count the number of rows within `Sale`, but this time using the relationship from `Date[Date]` to `Sale[Delivery Date Key]`.
   * You can do this using the `USERELATIONSHIP` function.
   * Documentation and examples can be found plentiful on the internet. :)

![Count examples with different relationships](img/count-userelationship.png)

## Alternative: Multiple date tables

The disadvantage of using multiple relationships is that within a measure, you have to specify which relationship to use. It is also not possible, for example, to use the *invoice date* on the rows against the *delivery date* on the years in a matrix - as shown below:

![Invoice vs. delivery years](img/invoice-vs-delivery-voorbeeld.png)

An alternative is to simply load a date table multiple times. Instead of having one table `Date`, you would have tables like `Delivery Date`, `Invoice Date`, etc.

4. Create a new calculated table named `Delivery Date`. The content can be exactly the same as the `Date` table.
1. Do the same for a new table `Invoice Date`.
1. Create relationships between `Sale` and the new tables.
1. Remove the relationships between `Date` and `Sale`.
1. Create a new measure named `Count of Sale Rows`.
1. Verify if the results are the same as with the `USERELATIONSHIP` approach.

![Delivery date and invoice date in two tables](img/delivery-date-invoice-date-two-tables.png)

10. Now create the matrix with *invoice year* vs. *delivery year* as shown below:

![Invoice vs. delivery years](img/invoice-vs-delivery-voorbeeld.png)

Splitting into separate date dimensions allows you to compare multiple date lines.

One disadvantage of this approach is that not everything can be linked to an *Order* or *Invoice* date: When a new table with purchases would be added, you suddenly have a purchase date.

Of course, you could link this to its own date table again. However, it becomes difficult to display both sales and purchases for a year over time in a single view.

11. Add data about purchases to your data model. It can be found in the `csv` folder, file `Fact.Purchase.csv`.
1. As you can see, the *Purchase* table only has one date column.
1. Create a new date table named *Purchase Date*. The content can be the same as the *Date* table.
1. Create a relationship between *Purchase* and *Purchase Date*.
1. Create a measure named `Count of Purchase rows`.
1. Now try to split `Count of Purchase rows` and `Count of Sale Rows` over `Calendar Year` in a single table. Try out the various date tables and see the results.

![Various examples of date tables](img/diverse-datumtabellen-resultaten.png)

You can partially overcome this by linking all tables with a relationship to the original `Date` table.

17. Add new relationships between the new tables (`Invoice Date`, `Delivery Date`, `Purchase Date`) and `Date`.
1. As you can see, only one of the relationships will be marked as **active**. Ensure that this is `Invoice Date`.
1. Change the relationships from `1:1` to `1:n` (where `Date` is the `1` side) and choose a one-directional filter.
1. Verify the functioning with a new table where you plot `'Date'[Calendar Year]` against:
   * `Count of Invoice Rows`
   * `Count of Purchase Rows`  
   ![Correct splitting of invoice and purchase rows](img/correcte-uitsplitsing-invoice-purchase.png)
1. Adjust the `Count of Delivery Rows` measure to make it work correctly again and add it to the table as well.

![Final result - everything in one view](img/eindresultaat.png)

As you can see, with some effort, you can add more functions to the date tables. However, in practice, this is not often applied - the model becomes less comprehensible with five date tables...

> ### 1:n
>
> Strictly speaking, adjusting the `1:1` relationship just now was not necessary for the data model: the date is unique on both sides of the relationship. However, when there is a `1:1` relationship, `USERELATIONSHIP` does not work exactly as expected. You would not have been able to complete the last step (adjusting `Count of Delivery Rows`).