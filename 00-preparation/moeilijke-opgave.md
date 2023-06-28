In a previous lab, you implemented the `strange quantity measure` function. We are going to reimplement it using an iterator function.

We will use the following requirements:

* We are looking at the quantity of sold products: `'Fact Sale'[Quantity]`
* When the numbers we are looking at are for **blue** products, we should remove the filter on `'Dimension Date'[Calendar Year]`. The blue products should always show the numbers for all years.
* When the numbers we are looking at are for **gray** products, we should show the numbers for the **red** products.
* In all other cases, the filter context should remain intact.

### Which table should we iterate over?

When using an iterator function, you should always consider which table you want to iterate over. Since an *iterator function* introduces a *row context* and we want to break down by *Color*, it seems logical to iterate over `'Dimension Stock Item'`. Another candidate could be `'Fact Sale'` (we can still retrieve the colors using `RELATED`).

A first attempt could be: `strange quantity measure = SUMX('Dimension Stock Item', 'Fact Sale'[Quantity])`. However, this doesn't work! From the *row context* within `'Dimension Stock Item'`, there isn't a single item that we can directly retrieve from the `'Fact Sale'` table. This is also logical: products are preferably sold multiple times.

So the solution can go in two directions:

* We iterate over `'Fact Sale'`, and use `'RELATED'` to check which color is selected. With that, we can implement our logic.
* We iterate over `'Dimension Stock Item'`, and introduce a new filter context.
we do not have direct access to `'Fact Sale'[Quantity]`. And because there is not a one-to-one 

* Consider carefully which table you want to iterate over and why.
* We are looking at the quantity of sold products: `'Fact Sale'[Quantity]`
* When the numbers we are looking at are for **blue** products, the filter of `'Dimension Date'[Calendar Year]` should be removed. So the blue products always show the numbers for all years.
* When the numbers we are looking at are for **gray** products, the numbers of the **red** products should be displayed.
* In all other cases, the filter context is kept intact.
* Make use of the knowledge you already have about:
  * `SUMX`
  * `RELATED`
  * `IF` (and nested IF statements)
  * `CALCULATE` combined with `ALL`

Two final tips:

* Start small. First build a measure that simply sums `'Fact Sale'[Quantity]` with an iterator, then expand with one exception (blue or gray). Only when that works, add the second exception.
* VAR statements will not help you here..

## Semi-additive measures
