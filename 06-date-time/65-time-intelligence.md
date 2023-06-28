# Time Intelligence

Open the file `66-time-intelligence`. In the previous lab, you created a `YTD` function to display the number of rows in your fact table. Now, a YTD of the row count isn't very useful, so we're going to fix that.

1. Create a measure named `[YTD Quantity]` that calculates the year-to-date total of sold products. The number of products can be found in the column `Sale[Quantity]`.
   * You can refer to the previously created *quick measure* for tips on how to solve this easily.
   * Verify with a line chart if the YTD Quantity behaves as expected at various levels.
2. The report users are now interested in the MTD (Month-to-Date). They want to compare it in one table with the MTD from a month ago and see the percentage difference.