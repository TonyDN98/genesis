# 1. Intro constants, integers, operators

## Intro
**Base elements** are **data** and **instructions**  
For **data**, the space in memory will be alocated in the **RAM**  
#### example
```c
int a, b;
cin>>a>>b;
cout<< (a + b) * 2;
// a , b are  data variables, the memory alocated it's in RAM
cin , cout are instructions;
```

## Data
Every data should have a data type associated.  
- Integer numbers
- Real numbers

We can classificate data between **VARIABLE** and **CONSTANT**  
REAL numbers	12.34 	-2.08	5.0  
INTEGER numbers 5	-7	+333

To manipulate data use have another tool "" **operators** ""  
The **data** that we put between **operands** are called **operators**  

Different type of **operators**
- Unar , applied to only one operand  
- Binar , applied to two operands  
- Ternary , simplified if  

### Arithmetic OPERATORS
| Operator      | Description   |
| ------------- | ------------- |
| +             | plus          |
| -             | minus         |
| *             | multiply      |
| /             | division      |
| %             | modulo        |

**Operators** applied to two integer numbers will result an **integer number**  
**Operators** applied to an least one **real operand** will result an **real number**  

| Expression    | Descritopn    |
| ------------- | ------------- |
| 3 + 3         | 6, integer    |
| 3 + 4.0       | 7.0, real     |
| 2.5 * 4       | 10.0, real    |
| 12 / 4	| 3, integer	|
| 1 / 4.0       | 0, integer	|
|12 % 4.0	| Compilation ERROR|
|

## Expressions
Every valid statement between **data** and **operators**, or **expression** with another **expression**.
| Expression    | Result        | Description		     |
| ------------- | ------------- |----------------------------
| 2 + 3 * 5  	| 17, integer       | * evaluated first	     |
| (2 + 3) * 5   | 25, integer       | ( 2 + 3) evaluate first|
| 12 / (12 % 4 )| Error on execution| Error, division with 0 |
| 2$5		| Error on compliation| Invalid expression   |


#### Operators "+" & '-' used as UNAR
|Expression	| Result	| Description		|
|-------------- |-------------- |---------------------- |
|3 * -(2 + 7)	| -27		| 3 * - 9		|
|3 - -(2 + 7)	| 12		| 3 - -9 => 3+9		|


### Exercitions
|Expression		| Result	|
|----------------------	|---------------|
|1 + 2.2		| 3.2
|12 * 12		| 144
|-10 * 12		| -120
|(12 + 3 * 5 )/4	| 6
| 43567 % 10		|
| 43567 / 10 % 10	|
| 43567 % 100 / 10	|
| 43567 / 100 % 10	|
| 43567 % 1000 / 100	|

### Questions
1. What is an operator?

2. What is an operand?

3. What is an expression?

4. What means the value of an expression?

5. Classify operands by priority

6. What types of error we have described?

7. What means classify operators by the number of operands
