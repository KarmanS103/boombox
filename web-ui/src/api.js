import store from './store';

export async function api_get(path) {
    let text = await fetch("http://localhost:4000/api/v1" + path, {});
    let resp = await text.json();
    return resp.data;
}

export async function api_post(path, data) {
    let opts = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    };
    let resp = await fetch("http://localhost:4000/api/v1" + path, opts);
    return await resp.json();
}


export function fetch_leaderboard() {
    api_get("/leaderboard").then((data) => store.dispatch({
        type: 'leaderboard/set',
        data: data,
    }));
}

export function fetch_user() {
    api_get("/users").then((data) => store.dispatch({
        type: 'users/set',
        data: data,
    }));
}

export function fetch_artist() {
    api_get("/artist").then((data) => store.dispatch({
        type: 'artist/set',
        data: data,
    }));
}

export function fetch_following_artist() {
    api_get("/following_artist").then((data) => store.dispatch({
        type: 'following_artist/set',
        data: data,
    }));
}


export function create_user(user) {
  return api_post("/users", {user});
}

export function create_artist(artist) {
  return api_post("/artist", {artist});
}

export function load_defaults() {
    fetch_leaderboard();
    fetch_user();
    fetch_artist();
}
