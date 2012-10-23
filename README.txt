It is very very simple to move the FullText catalog with SQL Server 2005 ( remember the pain of doing it with SQL 2000)

Here is how :-

 

1. Detach the database which contains the FullText Catalog. While detaching from Management Studio, there is "check box" called "Keep FullText Catalogs". Make sure that this is selected.

2. Move the catalog files to the location where you want them.

3. Attach the database from Management Studio and this will try and find the FT catalogs

 

=> this step will fail and it will prompt you to find the location of FTcatalog. say yes

=> choose the FTCatalog path and presss OK

 

4. Bingo ! you're done. Now wasnt that simple compared to SQL 2000