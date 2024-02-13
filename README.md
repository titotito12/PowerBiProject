 # Table Of Contents
  
  ##  Aim
  
  ##  Tasks
  
 ##  Star Schema Model
  
 ##   Measure Tables
  
 ##  Data and Geography Hierarchies
  
 ##  Visuals
  
 ##  Executive Summary Page
  
 ##  Customer Detail Page
  
 ##  Product Detail Page
  
 ##  Finish Navigation Bar
  
##   Connect to SQL Server
  
  





**PowerBiProject**

The project is for a Medium sized Retailer with innovating and High Business Inteligence that spand across different regions and accumulated large amount of sales from different sources over the years.
In this project, I am using GitHub to track changes to my code and save them online in a GitHub repo.

**Task 1**

I created an Azure Virtual Machine (VM) running Windows which i connected to it from my local machine, to the Azure Windows VM using the Remote Desktop Protocol (RDP). I then Download and install Power BI Desktop for Windows from the official Microsoft website.

**Task 2**

I  did Relationship and association with the tables by imporitg the Orders_Powerbi table using the Import option in Power BI
With Orders table as the  main fact table, which  contains information about each order, including the order and shipping dates, the customer, store and product IDs for associating with dimension tables, and the amount of each product ordered. Each order in this table consists of an order of a single product type, so there is only one product code per order. I cleaned the table by removing the security and confidential data such as Card Number
Split Column feature to separate the [Order Date] and [Shipping Date] columns into two distinct columns each: one for the date and another for the time

-  Delete the column named [Card Number] to ensure data privacy

-  Split Column feature to separate the [Order Date] and [Shipping Date] columns into two distinct columns each: one for the date and another for the time

-  Filter out and remove any rows where the [Order Date] column has missing or null values to maintain data integrity

-  Rename the columns in  dataset to align with Power BI naming conventions, ensuring consistency and clarity in the report
**Task 3**

The Products table contains information about each product sold by the company, including the product code, name, category, cost price, sale price, and weight.

- I Created   Stores Map Page by adding a New Map visual:
- Set the controls of the map as follows:
- Auto-Zoom: On
- Zoom buttons: Off
- Lasso button: Off

And Assign the Geography hierarchy to the Location field, and ProfitYTD to the Bubble size field.

I Added a slicer above the map by  setting  the slicer field to Stores[Country], and in the Format section set the slicer style as Tile and the Selection settings to Multi-select with Ctrl/Cmd and Show "Select All" as an option in the slicer.

### **Stores Drillthrough**

- A table showing the top 5 products, with columns: Description, Profit YTD, Total Orders, Total Revenue-nA column chart showing Total Orders by product category for the store
- Gauges for Profit YTD against a profit target of 20% year-on-year growth vs. the same period in the previous year. The target should use the Target field, not the Maximum Value field, as the target will change as we move through the year.
- A Card visual showing the currently selected store
- I created  some measures for the gauges as follows:

Profit YTD and Revenue YTD: You should have already created this earlier in the project
Profit Goal and Revenue Goal, which should be a 20% increase on the previous year's year-to-date profit or revenue at the current point in the year
Add the visuals to the drillthrough page
- I Created Stores tooltip Page.so as to enable the users to be able to see each store's year-to-date profit performance against the profit target just by hovering the mouse over a store on the map.
- I Download the Products.csv file  and then use Power BI's Get Data option to import the file into the project

- In the Data view, i Removed Duplicates function on the product_code column to ensure each product code is unique
- I cleaned and transform the data in the weight column as follows:-

In Power Query Editor, use the Column From Examples feature to generate two new columns from the weight column - one for the weight values and another for the units (e.g. kg, g, ml). 
For the newly created units column, replace any blank entries with kg
For the values column, convert the data type to a decimal number

From the Data view, create a new calculated column, such that if the unit in the units column is not kg, divide the corresponding value in the values column by 1000 to convert it to kilograms
Return to the Power Query Editor and delete any columns that are no longer needed

**Task 4**

From Power BI's Get Data option, i  connected to Azure Blob Storage and import the Stores table into the  project
with the Stores table contains information about each store, including the store code, store type, country, region, and address.
Blob Storage credentials:

- account_name = powerbistorage2
- Account Key = ZPUQ+verSniHMG7EqR5/VAQc0aUYYG1utLQQuke0JQqR18TRRZI1/vTX65OqeXfUgWAugYLL73Gp+AStozRNKw==
- Container Name = data-analytics

 I  Renamed the columns in the dataset to align with Power BI naming conventions, ensuring clarity and consistency in the report

  **Task 5**
  
  I Download the Customers.zip file from this link  and unzip it on the local machine. With the Get Data option in Power BI to import the Customers folder into the project. By Navigating to the folder, and then select Combine and Transform to import the data.

I created a Full Name column by combining the [First Name] and [Last Name] columns.
Delete any obviously unused columns (eg. index columns) and rename the remaining columns to align with Power BI naming conventions

**Task 6.**

I Updated the README file on the GitHub repository of this project with detailed information about the tasks accomplished in this milestone. For example you should describe the methods used to import the data, and the transformations you performed.

I Also saved the latest version of the Power BI .pbix file and upload it to the Github repository.

I created Data Table
Create a date table running from the start of the year containing the earliest date in the Orders['Order Date'] column to the end of the year containing the latest date in the Orders['Shipping Date'] column. You can use whichever DAX formula you prefer to create the table.

Now use DAX formulas to add the following columns to the date table:
Day of Week,Month Number (i.e. Jan = 1, Dec = 12 etc.),Month Name,Quarter,Year,Start of Year,Start of Quarter,Start of Month,Start of Week.


### **Star Schema Model**

- I Created relationships between the tables to form a star schema as  follows:

- Orders[productcode] to Products[product_code]
- Orders[Store Code] to Stores[store code]
- Orders[User ID] to Customers[User UUID]
- Orders[Order Date] to Date[date]
- Orders[Shipping Date] to Date[date]

I Ensure that the relationship between Orders[Order Date] and Date[date] is the active relationship, and that all relationships are one-to-many, with a single filter direction from the one side to the many side


### ** Measure Tables:**

- I Created a separate table for measures  tokeep our data model organized and easy to navigate. I  created a new table using DAX, or you can create a new table in the data Model View with Power Query Editor.
- I Created a measure called Total Orders that counts the number of orders in the Orders table.
- I Create a measure called Total Revenue that multiplies the Orders[Product Quantity] column by the Products[Sale_Price] column for each row, and then sums the result.
- I Create a measure called Total Profit which performs the following calculation:
- For each row, I subtracted the Products[Cost_Price] from the Products[Sale_Price], and then multiply the result by the Orders[Product Quantity].
  
Sums the result for all rows.

- I Create a measure called Total Customers that counts the number of unique customers in the Orders table. This measure needs to change as the Orders table is filtered, so do not just count the rows of the Customers table!
- I Created a measure called Total Quantity that counts the number of items sold in the Orders table.
- I Created a measure called Profit YTD that calculates the total profit for the current year.
- I Creatde a measure called Revenue YTD that calculates the total revenue for the current year.
- I Named the new blank table Measures Table and then click Load.

### ** Data and Geography Hierarchies:**

I created two hierarchies in this task: one for dates, to facilitate drill-down in the line charts, and one for geography, to allow you to filter our data by region, country and province/state.

**Create a date hierarchy using the following levels:**
Start of Year
Start of Quarter
Start of Month
Start of Week
Date

I Create a new calculated column in the Stores table called Country that creates a full country name for each row, based on the Stores[Country Code] column, according to the following scheme:
GB : United Kingdom
US : United States
DE : Germany
I Create a new calculated column in the Stores table called Geography that creates a full geography name for each row, based on the Stores[Country Region], and Stores[Country] columns, separated by a comma and a space.

The following columns have the correct data category assigned, as follows:
World Region : Continent
Country : Country
Country Region : State or Province

I Created a Geography hierarchy using the following levels:
World Region
Country
Country Region

### **Visuals**

- I Add a Donut Chart visual showing the total customers for each country, using the Users[Country] column to filter the [Total Customers] measure.
- I Add a Column Chart visual showing the number of customers who purchased each product category, using the Products[Category] column to filter the [Total Customers] measure
- I Add a Line Chart visual to the top of the page. It should show [Total Customers] on the Y axis, and use the Date Hierarchy we created previously for the X axis. Allow users to drill down to the month level, but not to weeks or individual dates.
- I Add a trend line, and a forecast for the next 10 periods with a 95% confidence interval

- I Created a new table, which displays the top 20 customers, filtered by revenue. The table should show each customer's full name, revenue, and number of orders.
- I Add conditional formatting to the revenue column, to display data bars for the revenue values
- Created a set of three card visuals that provide insights into the top customer by revenue. They should display the top customer's name, the number of orders made by the customer, and the total revenue generated by the customer.
- Add a date slicer to allow users to filter the page by year, using the between slicer style.
- I Created KPIs for Quarterly Revenue, Orders and Profit. To do so we will need to create a set of new measures for the quarterly targets. Create measures for the following:
Previous Quarter Profit
Previous Quarter Revenue
Previous Quarter Orders
Targets, equal to 5% growth in each measure compared to the previous quarter

- I Add a new KPI for the revenue:
The Value field should be Total Revenue
The Trend Axis should be Start of Quarter
The Target should be Target Revenue.
In the Format pane, I set the Trend Axis to On, expand the associated tab, and set the values as follows:
Direction : High is Good
Bad Colour : red
Transparency : 15%

- I Format the Callout Value so that it only shows to 1 decimal place.
- I Duplicated the card two more times, and set the appropriate values for the Profit and Orders cards.
- I Arranged the three cards below the revenue line chart.
  **Guages**
- I Added Guages by adding  a set of three gauges, showing the current-quarter performance of Orders, Revenue and Profit against a quarterly target. The CEO has told you that they are targeting 10% quarter-on-quarter growth in all three metrics.
- In the measures table, i define DAX measures for the three metrics, and for the quarterly targets for each metric.I created three gauge filters, and assign the measures you have created. In each case, the maximum value of the gauge should be set to the target, so that the gauge shows as full when the target is met.

- I Arranged the gauges so that they are evenly spaced along the top of the report, but leave another similarly-sized space for the card visuals that will display which slicer states are currently selected.



### **Plan out the FilterState Cards** 

To the left of the gauges,  i put some placeholder shapes for the cards which will show the filter state. Using a colour in keeping with the theme, i added two recatangle shapes, which together take up roughly the same space as one of the gauges.

- I added values to these that will eventually reflect the filter state of the slicers, by defining the following measures:
Category Selection = IF(ISFILTERED(Products[Category]), SELECTEDVALUE(Products[Category]), "No Selection"),"No Selection")
Country Selection = IF(ISFILTERED(Stores[Country]), SELECTEDVALUE(Stores[Country]), "No Selection"),"No Selection")

- I add a card visual to each of the rectangles, and one of these measures to each of them. Format the card visuals so that they are the same size as the gauges, and the text is centred.

- I Add an area chart of Revenue By Products by applying  the following fields:
X axis should be Dates[Start of Quarter]
Y axis values should be Total Revenue
Legend should be Products[Category]

- I Arranged it on the left of the page, extending to level with the start of the second gauge visual.
- I addd a top 10 products table underneath the area chart. You can copy the top customer table from the Customer Detail page to speed up formatting. The table should have the following fields:
Product Description
Total Revenue
Total Customers
Total Orders
Profit per Order.

### **Scatter Graph.**

I Created a new calculated column called [Profit per Item] in the Products table, using a DAX formula to work out the profit per item and configure it as follows:
Values should be Products[Description]
X-Axis should be Products[Profit per Item]
Y-Axis should be Orders[Total Quantity]
Legend should be Products[Category]


### **Slicer Toolbar**

I used Power BI's bookmarks feature to create a pop-out toolbar which can be accessed from the navigation bar on the left-hand side of our report.by dwnloading this  collection of custom icons. 

I Add a new blank button to the top of the navigation bar, set the icon type to Custom in the Format pane, and choose Filter_icon.png as the icon image and  set the tooltip text to Open Slicer Panel.
I Add a new rectangle shape in the same colour as the navigation bar. with its dimensions as the same height as the page, and about 3-5X the width of the navigation bar itself.

I Add two new slicers. One is  be set to Products[Category], and the other to Stores[Country].I Changed the titles to Product Category and Country respectively.

They are in Vertical List slicer style,possible to select multiple items in the Product Category slicer, but only one option should be selected in the Country slicer.
I Configured the Country slicer so that there is a Select All option and e
nsure the formatting is neat, and fits with the chosen report style. An example layout can be seen here .
In the Selection pane group the slicers with the slicer toolbar shape

I add  Back button so that we can hide the slicer toolbar when it's not in use as follows:-
Add a new button, and select the Back button type
Position it somewhere sensible, for example in the top-right corner of the toolbar
In the Selection pane, drag the back button into the group with the slicers and toolbar shape.
I Open the Bookmarks pane and add two new bookmarks: one with the toolbar group hidden in the Selection pane, and one with it visible. Name them Slicer Bar Closed and Slicer Bar Open. and Right-click each bookmark in turn, and ensure that Data is unchecked, so as to  prevent the bookmarks from altering the slicer state when we open and close the toolbar.

I assign the actions on our buttons to the bookmarks, then Open the Format pane and turn the Action setting on for both the Filter button and the Back button.



### **Executive Summary Page**

Product Category bar chart and Top 10 Products table should not filter the card visuals or KPIs


### **Customer Detail Page**

- Top 20 Customers table should not filter any of the other visuals - Total Customers by Product Donut Chart should not affect the Customers line graph - Total Customers by Country donut chart should cross-filter Total Customers by Product donut Chart

### **Product Detail Page**

- Orders vs. Profitability scatter graph should not affect any other visuals - Top 10 Products table should not affect any other visuals


### **Finish Navigation Bar.**
  From the Edit Interactions view in the Format tab of the ribbon, set the following interactions:


#### Executive Summary Page

Product Category bar chart and Top 10 Products table should not filter the card visuals or KPIs


#### Customer Detail Page

- Top 20 Customers table should not filter any of the other visuals - Total Customers by Product Donut Chart should not affect the Customers line graph - Total Customers by Country donut chart should cross-filter Total Customers by Product donut Chart

#### Product Detail Page

- Orders vs. Profitability scatter graph should not affect any other visuals - Top 10 Products table should not affect any other visuals

 ### **Connect to SQL Server**
  With Postgres database server hosted on Microsoft Azure. To connect to the server and run queries from VSCode, install the SQLTools extension.and, can connect to the server using the following details:

HOST: powerbi-data-analytics-server.postgres.database.azure.com
PORT: 5432
DATABASE: orders-db
USER: maya
PASSWORD: AiCore127!

I Printed a list of the tables in the database and save the result to a csv file for the reference.

I Printed a list of the columns in the orders table and save the result to a csv file called orders_columns.csv

I Repeated the same process for each other table in the database, saving the results to a csv file with the same name as the table.

- 
