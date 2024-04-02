# KeyDRM-Project
Summarized information from users who consumed content with Digital licenses (Key DRM).

1/ Data from tables: 
- customers: transactional data, including customerID, mac, created_date from each user/
- log_BHD: customers who watched content BHD, including customerID, movieID, Date, RealtimePlaying, ...
- log_Fimplus: customers who watched content Fimplus, including customerID, movieID, Date
- log_getDRM: customers who bought the monthly service, including customerID, Date, Mac
- MV_propertiesShownVN: information of all contents, including MovieID, title, isDRM. Content with 'isDRM' = 1 requires 1 key DRM


2/ Steps:
- Read data from files, Preprocessing: Rename, convert data types, fill empty rows, or drop empty rows.
- Filtered MV_propertiesShownVN by isDRM = 1 to retrieve all content required KeyDRM
- Merged with log_BHD to retrieve a list of users who consumed BHD content required KeyDRM.
- Merge with log_Fimplus to retrieve a list of users who consumed Fimplus content required KeyDRM
- Grouped by 'Date' in log_getDRM to summarize users who consumed KeyDRM content.
- Merge 3 results above by date, to retrieve a final result, summarized by date, how many users consumed KeyDRM content.
- Import the final result file into the PowerBI desktop to generate a dashboard.
- Present the final thoughts and insights in Microsoft PowerPoint.


3/ Tools:
- SQL
- Python
- Power BI Desktop
- PowerPoint
