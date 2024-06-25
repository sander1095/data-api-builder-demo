import 'bootstrap/dist/css/bootstrap.min.css';
import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';
import { Navbar, Nav, Button } from 'react-bootstrap';
import { useState } from 'react';

import './App.css';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

import BookList from './Components/BookList/BookList';
import AuthorList from './Components/AuthorList/AuthorList';

function App() {

  const [role, setRole] = useState('anonymous');

  const client = new ApolloClient({
    uri: 'http://localhost:5000/graphql',
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
        <Navbar bg="dark" variant="dark" expand="lg">
          <div className="maxWidth1200Centered" style={{ display: 'flex', padding: '1rem', justifyContent: 'space-between', alignItems: 'center'}}>
            <Navbar.Brand>Library Demo</Navbar.Brand>
            <div className="alert alert-primary d-inline-block mx-auto mb-0 text-start" role="alert" style={{ width: 'auto' }}>
              <strong style={{ color: role === 'anonymous' ? 'green' : 'inherit' }}>Anonymous</strong> users can <strong>read</strong><br/>
              <strong style={{ color: role === 'authenticated' ? 'green' : 'inherit' }}>Authenticated</strong> users can also <strong>create</strong> and <strong>update</strong> data <br/>
              <strong style={{ color: role === 'admin' ? 'green' : 'inherit' }}>Admins</strong> can also <strong>delete</strong> data <br/>
            </div>
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

        <div className="maxWidth1400Centered">
          <BookList role={role} />
          <AuthorList role={role} />
        </div>
      </div>
      <ToastContainer/>
    </ApolloProvider>
  );
}

export default App;
