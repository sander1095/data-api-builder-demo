# Demo

## Combined
This demo combines both aspects from `data-api-builder` and `static-web-app` into one for a shorter demo.

### Setup
1. Set up an `.env` file in `data-api-builder`:

    ```
    MSSQL="Server=localhost,1433;Database=database-combined;User Id=sa;Password=YourStrong@Passw0rd;trustServerCertificate=true"

    # development/production
    environment=development
    ```
2. Run SQL Server by running `docker compose up -d` in `combined/dab`.
3. Create a database called `database-combined` and run the `script.sql` script to set up data.
4. Run `dotnet tool restore` to install the DAB CLI.
   1. If this doesn't work well, try using `dotnet tool install Microsoft.DataApiBuilder -g` instead.
5. Run `dab start` in `combined/dab` to start the API.
6. **In another terminal, execute the following steps:**
7. Install the React project dependencies by running `npm i` in `combined/react`.
8. Run `npm start` in `combined/react` to start the React app.

### Demo content
1. Showcase the front-end and talk about having a React library application with books and authors, with DAB as the back-end and SQL Server as the database in Docker.
2. Talk about the roles and permissions and the log-in button switching roles which are set in the header requests.
3. Talk about DAB using the `Simulator` authentication provider so we can easily test roles in development. We'll showcase this later and talk more about production grade authentication in the presentation as well.
4. First, show the request and response that's done to get the books and authors (REST and GraphQL)
5. Try to delete a book and author when logged out and show the 403 error. Show the auth header in the request.
6. Log in as admin and delete a book and author. Show the auth header in the request, now it works.
7. Create a book called `C# in Depth` by author `3`, category `Technology` and imageUrl `https://i.pinimg.com/736x/ea/ba/ce/eabacee45f65cd08801c135756314cd5.jpg` to show how that works.
8. Finally, look at the book details of the 4th author. Showcase the GraphQL query that retrieves the author + books.
9. Summarize that all of this API functionality required **0 code**, it was all done in the DAB configuration file, which we'll look at next.
10. After this, go through the DAB Urls to showcase the Swagger, GaphQL and OpenAPI page
11. Then showcase the code tour.

### Links
1. Open `http://localhost:3000/` for the React app.
2. Open `https://localhost:5001/swagger` to see the API documentation.
3. Open `https://localhost:5001/api/openapi` to see OpenAPI definition.
4. Open `https://localhost:5001/graphql` to see the GraphQL playground.

## data-api-builder

### Setup
1. Set up an `.env` file in `data-api-builder`:

    ```
    MSSQL="Server=localhost,1433;Database=database;User Id=sa;Password=YourStrong@Passw0rd;trustServerCertificate=true"

    # development/production
    environment=development
    ```
2. Run SQL Server by running `docker compose up -d` in `data-api-builder`.
3. Import the `.bacpac` using SQL Server Management Studio (or another tool).
4. Run `dotnet tool restore` to install the DAB CLI.
   1. If this doesn't work well, try using `dotnet tool install Microsoft.DataApiBuilder -g` instead.
5. Run `dab start` in `data-api-builder` to start the API.

### Demo content
1. Showcase the API documentation and retrieve a list of books to let people get a feel for the API.
2. Show the `author-books-count` and `GetAllCowrittenBooksByAuthor` endpoints which are actually a view and store procedure!
3. Showcase the `api/openapi` endpoint and `/graphql` endpoint.
4. Showcase adding a book. We use a mix of REST and GraphQL purely for demo purposes!
   1. Add a series for "Red Rising" (and remove the `id` in the request body)
      ```json
      {
        "name": "Red Rising"
      }
      ```
   2. Add an author for "Pierce Brown" (and remove the `id` in the request body)
      ```json
      {
        "first_name": "Pierce",
        "last_name": "Brown"
      }
      ```
   3. Add a book and book author link using a GraphQL mutation: 
      ```graphql
      mutation {
        createBook(item: { title: "Red Rising", year: 2014, pages: 382, series_id: 1000000 }) {
          id
          title
        }
      }
  
      ## Uncomment and execute this after executing the previous mutation
      # mutation {
      #     createBookAuthor(item: { book_id: 1000002, author_id: 1000001, author_type_id: 1  }) { 
      #     book_id,
      #     author_id 
      #   }
      # }
      ```
5. Go through the code tour in the `data-api-builder/dab-config.json` file.

### Links
1. Open `http://localhost:5000/swagger` to see the API documentation.
2. Open `http://localhost:5000/api/openapi` to see OpenAPI definition.
3. Open `http://localhost:5000/graphql` to see the GraphQL playground.

## static-web-app

### Setup
1. Set up an `.env` file in `static-web-app/swa-db-connections`:

    ```
    DATABASE_CONNECTION_STRING="Server=tcp:sql-data-api-builder-demo.database.windows.net,1433;Initial Catalog=db-data-api-builder-demo;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;Authentication='Active Directory Interactive'"
    ```
2. Ensure the other demo's process has stopped before continuing.
3. Ensure that the database has whitelisted the IP address.
4. Run `npm i && npx swa start http://localhost:3000 --run "cd library-demo && npm i && npm start" --data-api-location swa-db-connections` in `static-web-app`.

### Demo content
1. Open the localhost version of the app and talk about it being a simple UI for another library app, built with React and running with the SWA cli.
2. There's a github action that will push changes to the live version of the app.
3. Showcase the CLI command and the `--data-api-location` flag.
4. Showcase the `swa-db-connections` folder and the config file.
5. Show that logged out users can read and things like delete will result in 403.
6. Showcase that this is all done using data-api-builder under the hood. There is no API to be found in this project!
7. When logging in, we can use the Azure Static Web App emulator's authentication to log in, making local development easier.
8. Log in with an admin role.
9. Now we can do things like deleting a book.
10. Open the live version and showcase thats its running the project in the app, again, with data api builder!
11. Now showcase the azure portal and the database connection setup.

### Links
1. Open `http://localhost:4280` for the localhost version of the app
2. Open `https://witty-smoke-062083f03.5.azurestaticapps.net/` for the live version of the app.
3. Open `https://portal.azure.com/#@Sandertenbrinkexs4all.onmicrosoft.com/resource/subscriptions/65cbea20-04e6-49ae-869f-bcd6fb4d318f/resourceGroups/rg-data-api-builder-demo/providers/Microsoft.Web/staticSites/swa-data-api-builder-demo/databaseConnection` for the Static Web App resource.
4. Open https://github.com/sander1095/data-api-builder-demo/pull/1 for the PR that creates a temporary environment for SWA.
5. Open `https://witty-smoke-062083f03-1.westeurope.5.azurestaticapps.net/` for the PR environment (Not set up with DAB!)