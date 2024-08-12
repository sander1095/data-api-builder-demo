// src/App.js
import React from "react";
import { ApolloProvider } from "@apollo/client";
import client from "./ApolloClient";
import Authors from "./Authors";

const App = () => {
  return (
    <ApolloProvider client={client}>
      <div className="App">
        <h1>Author Directory</h1>
        <Authors />
      </div>
    </ApolloProvider>
  );
};

export default App;
