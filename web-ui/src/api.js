import store from './store';

export async function api_get(path) {
    let text = await fetch("http://localhost:4000/api/v1" + path, {});
    let resp = await text.json();
    return resp.data;
}

export function fetch_leaderboard() {
    api_get("/leaderboard").then((data) => store.dispatch({
        type: 'leaderboard/set',
        data: data,
    }));
}

export function load_defaults() {
    fetch_leaderboard();
}