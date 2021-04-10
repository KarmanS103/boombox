// Based on code from Nat Tuck's lecture 18 code
import { connect } from 'react-redux';
import { Button } from 'react-bootstrap';
import { useState } from "react"
import config from "./config"

// Pulling the album titles for the user feed. 
async function get_album(apikey, artist_id) {
    const response = await fetch('https://thingproxy.freeboard.io/fetch/http://api.musixmatch.com/ws/1.1/artist.albums.get?apikey=' + apikey + '&artist_id=' + artist_id + '&s_release_date=desc&g_album_name=1', {});
    const json = await response.json();
    return json["message"]["body"]["album_list"];
}

function Artist({ artist }) {
    const [albums, setAlbums] = useState([])
    const [pull, setPull] = useState(true)
    let siaid = "41659"
    let onlyalbums = []

    if (pull) {
        get_album(config(), siaid).then((xs) => setAlbums(xs))
        setPull(false)
    }

    for (let i = 0; i < albums.length; i++) {
        onlyalbums.push(albums[i]["album"]["album_name"])
    }

    artist.splice(11, 14)
    return (
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <h4>Following</h4>
                    <form>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" checked="true"></input>
                            <label class="form-check-label" for="exampleCheck1">Sia</label>
                            {artist.map(
                                (ll) =>
                                    <div>
                                        <input type="checkbox" class="form-check-input"></input>
                                        <label class="form-check-label" for="exampleCheck1">{ll.name}</label>
                                    </div>
                            )}
                        </div>
                    </form>
                    <Button variant="primary" type="submit">Submit</Button>
                </div>
                <div class="col-10">
                    <h1>Sia</h1>
                    {onlyalbums.map(
                        (ll) =>
                            <div>
                                <p>{ll}</p>
                            </div>
                    )}
                </div>
            </div>
        </div>
    );
}

export default connect(({ artist }) => ({ artist }))(Artist);
