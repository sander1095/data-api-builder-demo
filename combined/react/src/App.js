import 'bootstrap/dist/css/bootstrap.min.css';
import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';
import { Navbar, Nav, Button } from 'react-bootstrap';
import { useState } from 'react';

import './App.css';

import BookList from './Components/BookList/BookList';

const client = new ApolloClient({
  uri: '/data-api/graphql',
  cache: new InMemoryCache({
    addTypename: false
  })
});

function App() {

  const [isLoggedIn, setIsLoggedIn] = useState(false);

  return (
    <ApolloProvider client={client}>
      <div className="App">
        <Navbar bg="dark" variant="dark">
          <div className="maxWidth1200Centered" style={{ display: 'flex', padding: '1rem', justifyContent: 'space-between'}}>
            <Navbar.Brand>Library Demo</Navbar.Brand>
            <Nav className="ml-auto">
              { isLoggedIn ?
                  <Button variant="light" onClick={(e) => { e.preventDefault(); setIsLoggedIn(false); }}>
                    Logout
                  </Button>
                :
                <Button variant="light" onClick={(e) => { e.preventDefault(); setIsLoggedIn(true); }}>
                    Login
                  </Button>
              }
            </Nav>
          </div>
        </Navbar>

        <div className="maxWidth1200Centered">
          <BookList IsLoggedIn={isLoggedIn} />

          {/* <AuthorList/> */}
        </div>
      </div>
    </ApolloProvider>
  );
}

export default App;
