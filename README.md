# PowerBiProject
In this project, I am using GitHub to track changes to my code and save them online in a GitHub repo.
Task1
I create an Azure Virtual Machine (VM) running Windows.
Once  VM has been provisioned, connect to it from my local machine, to the Azure Windows VM using the Remote Desktop Protocol (RDP). Utilise Microsoft Remote Desktop to establish this connection.
Download and install Power BI Desktop for Windows from the official Microsoft website.

Task 2
The Orders table is your main fact table. It contains information about each order, including the order and shipping dates, the customer, store and product IDs for associating with dimension tables, and the amount of each product ordered. Each order in this table consists of an order of a single product type, so there is only one product code per order.
Connect to the Azure SQL Database and import the orders_powerbi table using the Import option in Power BI. The credentials for the Azure DB are as follows:
You will need to use the Database credentials option
2. Navigate to the Power Query Editor and delete the column named [Card Number] to ensure data privacy

3. Use the Split Column feature to separate the [Order Date] and [Shipping Date] columns into two distinct columns each: one for the date and another for the time

4. Filter out and remove any rows where the [Order Date] column has missing or null values to maintain data integrity

5. Rename the columns in your dataset to align with Power BI naming conventions, ensuring consistency and clarity in your report

6. Task 3
7. The Products table contains information about each product sold by the company, including the product code, name, category, cost price, sale price, and weight.

8. 


Download the Products.csv file  and then use Power BI's Get Data option to import the file into your project


In the Data view, use the Remove Duplicates function on the product_code column to ensure each product code is unique


Follow the steps below to clean and transform the data in the weight column


In Power Query Editor, use the Column From Examples feature to generate two new columns from the weight column - one for the weight values and another for the units (e.g. kg, g, ml). You might need to sort the weight column by descending to get enough different examples to work with.
For the newly created units column, replace any blank entries with kg
For the values column, convert the data type to a decimal number
If any errors arise during the conversion, replace those error values with the number 1
From the Data view, create a new calculated column, such that if the unit in the units column is not kg, divide the corresponding value in the values column by 1000 to convert it to kilograms
Return to the Power Query Editor and delete any columns that are no longer needed

Task 4
The Stores table contains information about each store, including the store code, store type, country, region, and address.

Use Power BI's Get Data option to connect to Azure Blob Storage and import the Stores table into your project


Blob Storage credentials:

- account_name = powerbistorage2
- Account Key = ZPUQ+verSniHMG7EqR5/VAQc0aUYYG1utLQQuke0JQqR18TRRZI1/vTX65OqeXfUgWAugYLL73Gp+AStozRNKw==
- Container Name = data-analytics

  Rename the columns in your dataset to align with Power BI naming conventions, ensuring clarity and consistency in your report

  Task 5.
  Download the Customers.zip file from this link  and unzip it on your local machine. Inside the zip file is a folder containing three CSV files, each with the same column format, one for each of the regions in which the company operates.

Use the Get Data option in Power BI to import the Customers folder into your project. You'll need to use the Folder data connector. Navigate to your folder, and then select Combine and Transform to import the data. Power BI will automatically append the three files into one query.



Once the data are loaded into Power BI, create a Full Name column by combining the [First Name] and [Last Name] columns

Delete any obviously unused columns (eg. index columns) and rename the remaining columns to align with Power BI naming conventions

Task 6.
Document your achievements in a comprehensive manner. Update the README file on the GitHub repository of this project with detailed information about the tasks accomplished in this milestone. For example you should describe the methods used to import the data, and the transformations you performed.

Also save the latest version of your Power BI .pbix file and upload it to the Github repository.

I created Data Table
Create a date table running from the start of the year containing the earliest date in the Orders['Order Date'] column to the end of the year containing the latest date in the Orders['Shipping Date'] column. You can use whichever DAX formula you prefer to create the table.

Now use DAX formulas to add the following columns to your date table:
Day of Week
Month Number (i.e. Jan = 1, Dec = 12 etc.)
Month Name
Quarter
Year
Start of Year
Start of Quarter
Start of Month
Start of Week


Star Schema Model
Create relationships between the tables to form a star schema. The relationships should be as follows:

Orders[product_code] to Products[product_code]
Orders[Store Code] to Stores[store code]
Orders[User ID] to Customers[User UUID]
Orders[Order Date] to Date[date]
Orders[Shipping Date] to Date[date]

Ensure that the relationship between Orders[Order Date] and Date[date] is the active relationship, and that all relationships are one-to-many, with a single filter direction from the one side to the many side


Create a Measure Table:
Creating a separate table for measures is a best practice that will help us keep our data model organized and easy to navigate. You will be creating a lot of measures in this project, so it's important manage them effectively. There are two ways to do this. You can either create a new table using DAX, or you can create a new table in the data Model View with Power Query Editor. It is generally better to use the latter approach, as it makes the measures table visible in the Query Editor, which is useful for debugging and troubleshooting.


From the Model view, select Enter Data from the Home tab of the ribbon

Create Key Measures:
Next, you are going to create some of the key measures that will be used in our report. You will need to create more as you go through the project, but these will give you a starting point for building the analysis:

Create a measure called Total Orders that counts the number of orders in the Orders table


Create a measure called Total Revenue that multiplies the Orders[Product Quantity] column by the Products[Sale_Price] column for each row, and then sums the result


Create a measure called Total Profit which performs the following calculation:

For each row, subtract the Products[Cost_Price] from the Products[Sale_Price], and then multiply the result by the Orders[Product Quantity]

Sums the result for all rows

Create a measure called Total Customers that counts the number of unique customers in the Orders table. This measure needs to change as the Orders table is filtered, so do not just count the rows of the Customers table!


Create a measure called Total Quantity that counts the number of items sold in the Orders table


Create a measure called Profit YTD that calculates the total profit for the current year


Create a measure called Revenue YTD that calculates the total revenue for the current year

Getting stuck on this task? Click here to book a call to one of our support engineers
Name the new blank table Measures Table and then click Load


Create Data and Geography Hierarchies:
Hierarchies allow you to drill down into our data and perform granular analysis within our report. You will create two hierarchies in this task: one for dates, to facilitate drill-down in your line charts, and one for geography, to allow you to filter our data by region, country and province/state.


Create a date hierarchy using the following levels:

Start of Year
Start of Quarter
Start of Month
Start of Week
Date

Create a new calculated column in the Stores table called Country that creates a full country name for each row, based on the Stores[Country Code] column, according to the following scheme:
GB : United Kingdom
US : United States
DE : Germany

In addition to the country hierarchy, it can sometimes be helpful to have a full geography column, as in some cases this makes mapping more accurate. Create a new calculated column in the Stores table called Geography that creates a full geography name for each row, based on the Stores[Country Region], and Stores[Country] columns, separated by a comma and a space.

Ensure that the following columns have the correct data category assigned, as follows:

World Region : Continent
Country : Country
Country Region : State or Province

Create a Geography hierarchy using the following levels:

World Region
Country
Country Region



I Add a Donut Chart visual showing the total customers for each country, using the Users[Country] column to filter the [Total Customers] measure

I Add a Column Chart visual showing the number of customers who purchased each product category, using the Products[Category] column to filter the [Total Customers] measure
I Add a Line Chart visual to the top of the page. It should show [Total Customers] on the Y axis, and use the Date Hierarchy we created previously for the X axis. Allow users to drill down to the month level, but not to weeks or individual dates.

I Add a trend line, and a forecast for the next 10 periods with a 95% confidence interval

Create a new table, which displays the top 20 customers, filtered by revenue. The table should show each customer's full name, revenue, and number of orders.

I Add conditional formatting to the revenue column, to display data bars for the revenue values
Created a set of three card visuals that provide insights into the top customer by revenue. They should display the top customer's name, the number of orders made by the customer, and the total revenue generated by the customer.
Add a date slicer to allow users to filter the page by year, using the between slicer style.


I Created KPIs for Quarterly Revenue, Orders and Profit. To do so we will need to create a set of new measures for the quarterly targets. Create measures for the following:


Previous Quarter Profit
Previous Quarter Revenue
Previous Quarter Orders
Targets, equal to 5% growth in each measure compared to the previous quarter

Add a new KPI for the revenue:


The Value field should be Total Revenue
The Trend Axis should be Start of Quarter
The Target should be Target Revenue

In the Format pane, set the Trend Axis to On, expand the associated tab, and set the values as follows:


Direction : High is Good
Bad Colour : red
Transparency : 15%

Format the Callout Value so that it only shows to 1 decimal place


Duplicate the card two more times, and set the appropriate values for the Profit and Orders cards


Arrange the three cards below the revenue line chart

