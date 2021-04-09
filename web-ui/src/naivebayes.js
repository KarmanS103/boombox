import config from "./config"

async function search_artist(apikey, artist) {
    const response = await fetch('https://thingproxy.freeboard.io/fetch/http://api.musixmatch.com/ws/1.1/artist.search?apikey=' + apikey + '&q_artist=' + artist + '&page_size=5', {});
    const json = await response.json();
    return json["message"]["body"]["artist_list"][0]["artist"]["artist_id"];
}

async function get_album(apikey, artist_id) {
    const response = await fetch('https://thingproxy.freeboard.io/fetch/http://api.musixmatch.com/ws/1.1/artist.albums.get?apikey=' + apikey + '&artist_id=' + artist_id + '&s_release_date=desc&g_album_name=1', {});
    const json = await response.json();
    return json["message"]["body"]["album_list"][0]["album"]["album_id"];
}

async function get_album_tracks(apikey, album_id) {
    console.log(album_id)
    const response = await fetch('https://thingproxy.freeboard.io/fetch/http://api.musixmatch.com/ws/1.1/album.tracks.get?apikey=' + apikey + '&album_id=' + album_id + '&page=1&page_size=8', {});
    const json = await response.json();
    return json["message"]["body"]["track_list"];
}

async function get_lyrics(apikey, track_id) {
    const response = await fetch('https://thingproxy.freeboard.io/fetch/http://api.musixmatch.com/ws/1.1/track.lyrics.get?apikey=' + apikey + '&track_id=' + track_id, {});
    const json = await response.json();
    console.log(json)
    return json["message"]["body"]["lyrics"]["lyrics_body"];
}

function checkLength(word) {
    return word.length <= 10;
}

function generatelyrics(alllyrics, lyricscount) {
    if (lyricscount > 25){
        lyricscount = 25
    }
    let bars = []
    for (let i = 0; i < lyricscount; i++) {
        let words = []
        for (let j = 0; j < 6; j++) {
            var word = alllyrics[Math.floor(Math.random() * alllyrics.length)];
            words.push(word)
        }
        bars.push(words)
    }

    return bars
}


export default async function naivebayes(artist, lyricscount) {
    let apikey = config()

    let artist_id = await search_artist(apikey, artist);
    console.log(artist_id)
    let album_id = await get_album(apikey, artist_id)
    console.log(album_id)
    let track_id = await get_album_tracks(apikey, album_id)
    console.log(track_id)

    let tracks = []

    for (let i = 0; i < track_id.length; i++) {
        tracks.push(track_id[i]["track"]["track_id"])
    }
    console.log(tracks)

    let alllyrics = []

    for (let x = 0; x < tracks.length; x++) {
        let lyrics = await get_lyrics(apikey, tracks[x])
        let splitup = lyrics.split(" ")
        alllyrics = alllyrics.concat(splitup)
    }

    alllyrics = alllyrics.filter(checkLength)

    let generatedlyrics = generatelyrics(alllyrics, lyricscount)

    console.log(generatedlyrics)
    return generatedlyrics
}