// Based on code from Nat Tuck's Lecture 17 lecture
import { useState } from 'react';

import { Form, Button } from 'react-bootstrap';

import { create_user } from './api';

export default function CreateUser() {
    const [user, setUser] = useState({
        'email': "",
        'password': ""
    });

    function onSubmit(ev) {
        ev.preventDefault();
        create_user(user);
        setUser({"email":"", "password":""})
    }

    function updateEmail(ev) {
        let newUser = Object.assign({}, user);
        newUser["email"] = ev.target.value;
        setUser(newUser);
    }

    function updatePassword(ev) {
        let newUser = Object.assign({}, user);
        newUser["password"] = ev.target.value;
        setUser(newUser);
    }

    return (
        <div>
            <h1>Register</h1>
            <Form onSubmit={onSubmit}>
                <Form.Group>
                    <Form.Label>Email</Form.Label>
                    <Form.Control type="email" onChange={updateEmail} value={user.email} placeholder="Email" />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" onChange={updatePassword} value={user.password} placeholder="Password" />
                </Form.Group>

                <Button variant="primary" type="submit">
                    Submit
                </Button>
            </Form>
        </div>
    )
}
