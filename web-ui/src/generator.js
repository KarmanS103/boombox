import { useState } from 'react';
import { Form, Button } from 'react-bootstrap';

import naivebayes from "./naivebayes";

function GeneratedLyrics(lyrics, quant) {
    return (
        <div>
            <h1>Generated Lyrics</h1>
            {lyrics["lyrics"].map((ll) => (<p key={ll.id}>{ll.join(" ")}</p>))}
        </div>
    )
}

export default function Generator() {
    const [artist, setArtist] = useState("")
    const [lyrics, setLyrics] = useState("")
    const [generatedLyrics, setGeneratedLyrics] = useState([])
    const [quantity, setQuantity] = useState("")

    function onSubmit(ev) {
        ev.preventDefault();
        setQuantity("hello");
        naivebayes(artist, lyrics).then((xs) => setGeneratedLyrics(xs));
        setArtist("")
        setLyrics("")
    }

    function updateArtist(ev) {
        let artist = ev.target.value;
        setArtist(artist);
    }

    function updateLyrics(ev) {
        let artist = ev.target.value;
        setLyrics(artist);
    }

    return (
        <div>
            <h1>Generate Lyrics</h1>
            <Form onSubmit={onSubmit}>
                <Form.Group>
                    <Form.Label>Artist</Form.Label>
                    <Form.Control type="text" value={artist} onChange={updateArtist} placeholder="Artist" />
                </Form.Group>

                <Form.Group>
                    <Form.Label>Number of Lyrics</Form.Label>
                    <Form.Control type="text" value={lyrics} onChange={updateLyrics} placeholder="Number of Lyrics" />
                </Form.Group>

                <Button variant="primary" type="submit">Submit</Button>
            </Form>
            <br></br>
            <GeneratedLyrics lyrics={generatedLyrics} quant={quantity}></GeneratedLyrics>
        </div>
    );
}