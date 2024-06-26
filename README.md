# KeyDRM-Project
Summarized information from users who consumed content with Digital licenses (Key DRM).

I. Data from tables: 
- customers: transactional data, including customerID, mac, created_date from each user/
- log_BHD: customers who watched content BHD, including customerID, movieID, Date, RealtimePlaying, ...
- log_Fimplus: customers who watched content Fimplus, including customerID, movieID, Date
- log_getDRM: customers who bought the monthly service, including customerID, Date, Mac
- MV_propertiesShownVN: information of all contents, including MovieID, title, isDRM. Content with 'isDRM' = 1 requires 1 key DRM


II. Steps:
  1. Get data and Data Wrangling:
  - 1.1. Read data from files
  - 1.2. Preprocessing: Rename, convert data types, fill empty rows, or drop empty rows.

  2. Data Exploration:
  - 2.1. Filtered MV_propertiesShownVN by isDRM = 1 to retrieve all content required KeyDRM
  - 2.2. Merged with log_BHD to retrieve a list of users who consumed BHD content required KeyDRM.
  - 2.3. Merge with log_Fimplus to retrieve a list of users who consumed Fimplus content required KeyDRM
  - 2.4. Grouped by 'Date' in log_getDRM to summarize users who consumed KeyDRM content.
  - 2.5. Merge 3 results above by date, to retrieve a final result, summarized by date, how many users consumed KeyDRM content

  3. Generate report:
  - 3.1. Import the final result file into the PowerBI desktop to generate a dashboard
  - 3.2. Present the final thoughts and insights in Microsoft PowerPoint


III. Tools:
- SQL
- Python
- Power BI Desktop
- PowerPoint
