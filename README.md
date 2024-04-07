# Demo

## data-api-builder

### Setup
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
  
      # Uncomment and execute this after executing the previous mutation
      # mutation {
      #     createBookAuthor(item: { book_id: 1000002, author_id: 1000001, author_type_id: 2000  }) { 
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
