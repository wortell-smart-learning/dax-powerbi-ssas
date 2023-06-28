# DAX Basics

DAX (Data Analysis Expressions) is a formula language used in Power BI, Analysis Services, and Power Pivot in Excel. It is designed to create calculations and queries on data models. 

DAX formulas can be used to perform operations such as mathematical calculations, logical comparisons, string manipulations, and aggregation functions. 

## Syntax

DAX formulas follow a specific syntax:

- Functions: DAX functions are used to perform specific operations. They are written as `FUNCTIONNAME(argument1, argument2, ...)`. Some examples of DAX functions are `SUM`, `COUNT`, `IF`, and `AVERAGE`.

- Operators: DAX supports various operators, such as arithmetic operators (+, -, *, /), comparison operators (<, >, =, <>), and logical operators (AND, OR, NOT).

- Values: DAX formulas can include values such as numbers, text strings, and dates. Numbers are written without quotation marks, text strings are enclosed in double quotation marks, and dates are written as `DATE(year, month, day)`.

## Calculated Columns vs Measures

DAX can be used to create calculated columns and measures. 

- Calculated Columns: These are columns created within a data model that use a DAX formula to calculate values. Calculated columns are stored in memory and can be used to filter and group data.

- Measures: These are calculations performed on aggregated data. Measures are commonly used for calculations such as totals, averages, and percentages. They are not stored in memory but are calculated on the fly as needed.

## Querying with DAX

DAX can be used to query data models and retrieve specific information. The `FILTER` function is often used to filter data based on specific criteria. DAX queries can also include sorting, grouping, and aggregation.

## Conclusion

DAX is a powerful formula language used in Power BI, Analysis Services, and Power Pivot. Understanding the basics of DAX syntax and its usage for creating calculations and queries is essential for working with these tools.
