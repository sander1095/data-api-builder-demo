// src/Authors.js
import React from "react";
import { useQuery, gql } from "@apollo/client";

const GET_AUTHORS = gql`
  query {
    authors {
      items {
        id
        firstName
        lastName
      }
    }
  }
`;

const Authors = () => {
  const { loading, error, data } = useQuery(GET_AUTHORS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error: {error.message}</p>;

  return (
    <div>
      <h2>Authors List</h2>
      <ul>
        {data.authors.items.map((author) => (
          <li key={author.id}>{`${author.firstName} ${author.lastName}`}</li>
        ))}
      </ul>
    </div>
  );
};

export default Authors;
