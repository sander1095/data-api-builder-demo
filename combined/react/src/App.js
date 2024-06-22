import 'bootstrap/dist/css/bootstrap.min.css';
import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';
import { Navbar, Nav, Button } from 'react-bootstrap';
import { useState } from 'react';

import './App.css';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

import BookList from './Components/BookList/BookList';
import AuthorList from './Components/AuthorList/AuthorList';

const client = new ApolloClient({
  uri: 'https://localhost:5001/graphql',
  cache: new InMemoryCache({
    addTypename: false
  })
});

function App() {

  const [role, setRole] = useState('anonymous');

  return (
    <ApolloProvider client={client}>
      <div className="App">
        <Navbar bg="dark" variant="dark">
          <div className="maxWidth1200Centered" style={{ display: 'flex', padding: '1rem', justifyContent: 'space-between'}}>
            <Navbar.Brand>Library Demo</Navbar.Brand>
            <Nav className="ml-auto">
            {role === 'anonymous' ?
              <Button variant="light" onClick={() => setRole('authenticated')}>
                Log in
              </Button>
            : role === 'authenticated' ?
              <Button variant="light" onClick={() => setRole('admin')}>
                Log in as administrator
              </Button>
            :
              <Button variant="light" onClick={() => setRole('anonymous')}>
                Log out
              </Button>
            }
            </Nav>
          </div>
        </Navbar>

        <div className="maxWidth1200Centered">
          <BookList role={role} />

          <AuthorList role={role} />
        </div>
      </div>
      <ToastContainer/>
    </ApolloProvider>
  );
}

export default App;
