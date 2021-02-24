# Question - Bracketed Tax Engine:
Write a program that calculates income tax based on the following rules:
  - The portion of the income that is less than $10k is untaxed
  - The portion of the income that is less than $20k is taxed at 10%
  - The portion of the income that is less than $50k is taxed at 20%
  - Any portion of the income that is above $50k is taxed at 30%


1. Assume this application will be used by a 3rd party tax consultant who will have to run this for
100 clients.
Write a program that is scalable.
The program should take the $ income and return the tax amount.


2. Imagine there are actually 50+ brackets that change every year, and we need to compute 1
Billion income tax projections every year.
Describe in a few bullet points how you’d build a solution that scales.


# Understanding

-Receive input as Float
-Determine top tax bracket income lands in
-Break out income to be taxed by all brackets appropriately.
-Sum income tax for all brackets
-Return tax amount.

# Scalable number of clients and tax brackets

-Import clients and tax brackets from CSV file
