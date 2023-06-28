# Time Intelligence

Open the file `66-time-intelligence`. In the previous lab, you created a `YTD` function that displays the number of rows in your fact table. However, a YTD of the row count isn't very useful, so we need to improve it.

1. Create a measure called `[YTD Quantity]` that calculates the year-to-date total of sold products. The number of products can be found in the `Sale[Quantity]` column.
   * You can refer to the previously created *quick measure* for tips on how to easily solve this.
   * Use a line chart to verify if the YTD Quantity behaves as expected at different levels.
2. The report users are now interested in the MTD (Month-to-Date). They want to compare it in one table with the MTD from a month ago and see the percentage difference.