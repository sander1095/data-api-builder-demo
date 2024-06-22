import 'bootstrap/dist/css/bootstrap.min.css';
import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';
import { Navbar, Nav, Button } from 'react-bootstrap';
import { useState } from 'react';

import './App.css';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

import BookList from './Components/BookList/BookList';
import AuthorList from './Components/AuthorList/AuthorList';

function App() {

  const [role, setRole] = useState('anonymous');

  
const client = new ApolloClient({
  uri: 'https://localhost:5001/graphql',
  headers: {
    'X-MS-API-ROLE': role
  },
  cache: new InMemoryCache({
    addTypename: false
  })
});

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
          <div className="container">
            <div className="row justify-content-center pt-3">
              <div className="col-md-8 text-center">
                <div className="alert alert-primary text-start d-inline-block mx-auto" role="alert" style={{ width: 'auto' }}>
                  <strong>Anonymous</strong> users can <strong>read</strong><br/>
                  <strong>Authenticated</strong> users can also <strong>create</strong> and <strong>update</strong> data <br/>
                  <strong>Admins</strong> can also <strong>delete</strong> data <br/>
                </div>
              </div>
            </div>
          </div>

          <BookList role={role} />

          <AuthorList role={role} />
        </div>
      </div>
      <ToastContainer/>
    </ApolloProvider>
  );
}

export default App;
