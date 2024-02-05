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

Creation of  Stores Map Page 
On the Stores Map page, add a new map visual. It should take up the majority of the page, just leaving a narrow band at the top of the page for a slicer. Set the style to your satisfaction in the Format pane, and make sure Show Labels is set to On.

Set the controls of your map as follows:
Auto-Zoom: On
Zoom buttons: Off
Lasso button: Off

Assign your Geography hierarchy to the Location field, and ProfitYTD to the Bubble size field

Add country slicers
Add a slicer above the map, set the slicer field to Stores[Country], and in the Format section set the slicer style as Tile and the Selection settings to Multi-select with Ctrl/Cmd and Show "Select All" as an option in the slicer.

Create a stores Drillthrough
A table showing the top 5 products, with columns: Description, Profit YTD, Total Orders, Total Revenue
A column chart showing Total Orders by product category for the store
Gauges for Profit YTD against a profit target of 20% year-on-year growth vs. the same period in the previous year. The target should use the Target field, not the Maximum Value field, as the target will change as we move through the year.
A Card visual showing the currently selected store

Create a new page named Stores Drillthrough. Open the format pane and expand the Page information tab. Set the Page type to Drillthrough and set Drill through when to Used as category. Set Drill through from to country region.

We are going to need some measures for the gauges as follows:

Profit YTD and Revenue YTD: You should have already created this earlier in the project
Profit Goal and Revenue Goal, which should be a 20% increase on the previous year's year-to-date profit or revenue at the current point in the year
Add the visuals to the drillthrough page


Create Stores tooltip Page.
You want users to be able to see each store's year-to-date profit performance against the profit target just by hovering the mouse over a store on the map. To do this, create a custom tooltip page, and copy over the profit gauge visual, then set the tooltip of the visual to the tooltip page you have created.
Update Documentation.
Document your achievements in a comprehensive manner. Update the README file on the GitHub repository of this project with detailed information about the tasks accomplished in this milestone. For example you should describe the visuals you created for this page, and add screenshots of how the visuals were set up, and a screenshot of the finished page

Also save the latest version of your Power BI .pbix file and upload it to the Github repository.



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

Add Guages

Add a set of three gauges, showing the current-quarter performance of Orders, Revenue and Profit against a quarterly target. The CEO has told you that they are targeting 10% quarter-on-quarter growth in all three metrics.


In your measures table, define DAX measures for the three metrics, and for the quarterly targets for each metric

Create three gauge filters, and assign the measures you have created. In each case, the maximum value of the gauge should be set to the target, so that the gauge shows as full when the target is met.

Apply conditional formatting to the callout value (the number in the middle of the gauge), so that it shows as red if the target is not yet met, and black otherwise. You may use different colours if it first better with your colour scheme.

Arrange your gauges so that they are evenly spaced along the top of the report, but leave another similarly-sized space for the card visuals that will display which slicer states are currently selected



Plan out the FilterState Cards 
To the left of the gauges, we are going to put some placeholder shapes for the cards which will show the filter state. Using a colour in keeping with your theme, add two recatangle shapes, which together take up roughly the same space as one of the gauges.

We will add values to these that will eventually reflect the filter state of the slicers. To do this, we need to define the following measures:
Category Selection = IF(ISFILTERED(Products[Category]), SELECTEDVALUE(Products[Category]), "No Selection"),"No Selection")
Country Selection = IF(ISFILTERED(Stores[Country]), SELECTEDVALUE(Stores[Country]), "No Selection"),"No Selection")

Now add a card visual to each of the rectangles, and one of these measures to each of them. Format the card visuals so that they are the same size as the gauges, and the text is centred.

Add an area chart of Revenue By Products
We now want to add an area chart that shows how the different product categories are performing in terms of revenue over time.

Add a new area chart, and apply the following fields:


X axis should be Dates[Start of Quarter]
Y axis values should be Total Revenue
Legend should be Products[Category]

Arrange it on the left of the page, extending to level with the start of the second gauge visual.


Add a top 10 products table underneath the area chart. You can copy the top customer table from the Customer Detail page to speed up formatting. The table should have the following fields:


Product Description
Total Revenue
Total Customers
Total Orders
Profit per Order

Add a scatter Graph
The products team want to know which items to suggest to the marketing team for a promotional campaign. They want a visual that allows them to quickly see which product ranges are both top-selling items and also profitable.

A scatter graph would be ideal for this job.


Create a new calculated column called [Profit per Item] in your Products table, using a DAX formula to work out the profit per item

Add a new Scatter chart to the page, and configure it as follows:

Values should be Products[Description]
X-Axis should be Products[Profit per Item]
Y-Axis should be Orders[Total Quantity]
Legend should be Products[Category]


Create a slicer Toolbar
Slicers are a handy way for users to control how the data on a page are filtered, but adding multiple slicers can clutter up the layout of your report page.

A professional-looking solution to this issue is to use Power BI's bookmarks feature to create a pop-out toolbar which can be accessed from the navigation bar on the left-hand side of our report.


Download this  collection of custom icons. We will use these for all of our navigation bar icons.


Add a new blank button to the top of your navigation bar, set the icon type to Custom in the Format pane, and choose Filter_icon.png as the icon image. Also set the tooltip text to Open Slicer Panel.


Add a new rectangle shape in the same colour as your navigation bar. Its dimensions should be the same height as the page, and about 3-5X the width of the navigation bar itself. Open the Selection pane and bring it to the top of the stacking order.


Add two new slicers. One should be set to Products[Category], and the other to Stores[Country]. Change the titles to Product Category and Country respectively.


They should be in Vertical List slicer style
It should be possible to select multiple items in the Product Category slicer, but only one option should be selected in the Country slicer
Configure the Country slicer so that there is a Select All option
Ensure the formatting is neat, and fits with your chosen report style. An example layout can be seen here .
In the Selection pane group the slicers with your slicer toolbar shape

We need to add a Back button so that we can hide the slicer toolbar when it's not in use.


Add a new button, and select the Back button type
Position it somewhere sensible, for example in the top-right corner of the toolbar
In the Selection pane, drag the back button into the group with the slicers and toolbar shape

Open the Bookmarks pane and add two new bookmarks: one with the toolbar group hidden in the Selection pane, and one with it visible. Name them Slicer Bar Closed and Slicer Bar Open. Right-click each bookmark in turn, and ensure that Data is unchecked. This will prevent the bookmarks from altering the slicer state when we open and close the toolbar.


The final step is to assign the actions on our buttons to the bookmarks. Open the Format pane and turn the Action setting on for both your Filter button and your Back button.

For each button, set the Type to Bookmark, and select the appropriate bookmark. Finally, test your buttons and slicers. Remember you need to Ctrl-Click to use buttons while designing the report in Power BI Desktop.


