Project Setup Instructions

This project is built using ASP.NET MVC with SQL Server for the database.

1. Database Setup
   - Before running the project, you need to set up the database.
   - Execute the provided SQL script "database.sql" to create the required database and tables.

2. Configure Database Connection
   After setting up the database, follow these steps:
   
   1. Open the solution file "urlShortener_eb.sln" in Visual Studio.
   2. In the Solution Explorer, locate and open the "Web.config" file.
   3. Inside the <connectionStrings> section, find the following line:
   
      <add name="us_eraEntities" connectionString="metadata=res://*/Models.urlShortenerModel.csdl|res://*/Models.urlShortenerModel.ssdl|res://*/Models.urlShortenerModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=DESKTOP-GP04N0I;initial catalog=us_erab;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />
   
   4. Replace "DESKTOP-GP04N0I" in the "data source" attribute with the name of your SQL Server instance.
      Example:
      <add name="us_eraEntities" connectionString="metadata=res://*/Models.urlShortenerModel.csdl|res://*/Models.urlShortenerModel.ssdl|res://*/Models.urlShortenerModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=YourServerNameHere;initial catalog=us_erab;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />

3. Run the Project
   - Build and run the project to start using the application. You can the run the project by clicking ctrl + F5.
