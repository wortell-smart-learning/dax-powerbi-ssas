# Operators

To "test" the functionality of operators, we are going to create a significant number of calculated columns and calculated measures. Open the file **11-operators-minilab** for this purpose.

## Arithmetic

To test the arithmetic operators, we will create a simple measure in which we perform some calculations directly. Drag the measures onto the canvas to verify if the content matches your expectations. You may need to switch to a different visual to display the result correctly.

1. `4 = 2 + 2`
2. `5 = 4 + 2` (yes, you read it correctly)
3. `groot = 10 ^ 200`
4. `Het is vandaag maandag = WEEKDAY(TODAY()) = 2`
   
## Logical

5. Create a measure named `Is het vandaag donderdag?` that can have two possible values:
   * If today is Thursday: "Het is vandaag donderdag"
   * If today is not Thursday: "Het is vandaag geen donderdag!"
   * Use IF
6. Create a measure named `Gegroet`. The measure can have the following values:
   * Before 12:00 PM: "Goedemorgen!"
   * After 12:00 PM: "Goedemiddag!"
   * Use **IF**, **HOUR**, and **NOW()**
   * *(Bonus, try it once the measure works: After 7:00 PM: "Goedenavond!")*
7. Now combine measures 5 and 6 into a new measure `De Donderdagochtendgroet`
   * On Thursday afternoon: "Het is donderdagmiddag!!"
   * At all other times: the value of measure `Gegroet`
   * Use only one IF statement within this measure
   
## Concatenation

7. Modify the function from step 6 so that your (login)name is mentioned in the text.
   * Use the function **USERPRINCIPALNAME()** for this
   * The text should now be "Goedemiddag, koos@bitrainer.nl!"