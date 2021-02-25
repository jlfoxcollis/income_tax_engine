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

# Build

-Ruby 2.5.3
-Minitest

#uses
-CSV, pry


# Understanding

-Receive input as Float
-Determine top tax bracket income lands in
-Break out income to be taxed by all brackets appropriately.
-Sum income tax for all brackets
-Return tax amount.

# Scalable number of clients and tax brackets - High level

-Import clients and tax brackets from CSV file
-Current run time for 50 tax brackets and 100k clients is 45 seconds on my local machine.  
-For 1b clients that would come out to 125 hours on my local machine, yikes!  
-Potential for refactor would be to generate Objects for the tax brackets and those objects would have a base income_tax + the calculated tax for the leftover income in that bracket.
-To handle 1 Billion tax projections, I would want to chunk the data into separate csv files based on income, where you can run this calculation simultaneously and generate multiple csv files to export.  These CSV files would be based on the tax bracket and all clients that fall within that bracket.
