import { useState } from 'react';

import { Form, Button } from 'react-bootstrap';

import { create_artist, fetch_artist } from './api';

export default function CreateArtist() {

    const [artist, setArtist] = useState({
        'name': ""
    });

    function onSubmit(ev) {
        ev.preventDefault();
        create_artist(artist);
    }

    function updateName(ev) {
        let newArtist = Object.assign({}, artist);
        newArtist["name"] = ev.target.value;
        setArtist(newArtist);
    }

    return (
        <div>
            <h1>Create Artist</h1>
            <Form onSubmit={onSubmit}>
                <Form.Group>
                    <Form.Label>Name</Form.Label>
                    <Form.Control type="text" onChange={updateName} value={artist.name} placeholder="name" />
                </Form.Group>
                <Button variant="primary" type="submit">
                    Submit
                </Button>
            </Form>
        </div>
    )
}
