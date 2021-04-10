import { Button, Form } from 'react-bootstrap';
import { useState } from 'react';
import { Redirect } from 'react-router-dom';
import { connect } from 'react-redux';
import { api_login } from './api';


function Login({session}) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  function onSubmit(ev) {
    ev.preventDefault();
    api_login(email, password);
  }
  let loggedIn = null;
  if (session) {
      loggedIn = (<Redirect to="/" />);
  }
  
  return (
      <div>
      <Form onSubmit={onSubmit}>
        {loggedIn}
        <h2>User Login</h2>
        <Form.Group controlId="LoginEmail">
          <Form.Label>Email</Form.Label>
          <Form.Control 
                        type="email"
                        onChange={ev => setEmail(ev.target.value)}
                        value={email} />
        </Form.Group>
        <Form.Group controlId="LoginPassword">
          <Form.Label>Password</Form.Label>
          <Form.Control
                        type="password"
                        onChange={(ev) => setPassword(ev.target.value)}
                        value={password} />
        </Form.Group>
        <Button variant="primary" type="submit">
          Login
        </Button>
      </Form>
      </div>
  );
}
export default connect(({session}) => ({session}))   (Login);
