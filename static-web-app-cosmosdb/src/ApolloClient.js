// src/ApolloClient.js
import { ApolloClient, InMemoryCache } from "@apollo/client";

const client = new ApolloClient({
  uri: "/data-api/graphql/",
  cache: new InMemoryCache(),
});

export default client;
