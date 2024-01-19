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
