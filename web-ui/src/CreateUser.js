import { useState } from 'react';

import { Form, Button } from 'react-bootstrap';

import { create_user, fetch_users } from './api';

export default function CreateUser() {

    const [user, setUser] = useState({
        'email': "",
        'password_hash': ""
    });

    function onSubmit(ev) {
        ev.preventDefault();
        create_user(user);
    }

    function updateEmail(ev) {
        let newUser = Object.assign({}, user);
        newUser["email"] = ev.target.value;
        setUser(newUser);
    }

    function updatePassword(ev) {
        let newUser = Object.assign({}, user);
        newUser["password_hash"] = ev.target.value;
        setUser(newUser);
    }

    return (
        <div>
            <h1>Create User</h1>
            <Form onSubmit={onSubmit}>
                <Form.Group>
                    <Form.Label>Email</Form.Label>
                    <Form.Control type="email" onChange={updateEmail} value={user.email} placeholder="email" />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" onChange={updatePassword} value={user.password_hash} />
                </Form.Group>

                <Button variant="primary" type="submit">
                    Submit
                </Button>
            </Form>
        </div>
    )
}
