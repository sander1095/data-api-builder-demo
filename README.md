# Demo

## data-api-builder

1. Set up an `.env` file in `data-api-builder`:

    ```
    MSSQL="Server=localhost,1433;Database=LibraryDB;User Id=sa;Password=YourStrong@Passw0rd;trustServerCertificate=true"

    # development/production
    environment=development
    ```
2. Run SQL Server by running `docker-compose up -d` in `data-api-builder`.
3. Import the `.bacpac` using SQL Server Management Studio (or another tool).
4. Run `dotnet tool restore` to install the DAB CLI
5. Run `dab start` in `data-api-builder` to start the API.


### Links
1. Open `http://localhost:5000/swagger` to see the API documentation.
2. Open `http://localhost:5000/api/openapi` to see OpenAPI definition.
3. Open `http://localhost:5000/graphql` to see the GraphQL playground.
