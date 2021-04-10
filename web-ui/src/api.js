// Based on code from Nat Tuck's Lecture 17 code
import store from './store';

// Get request from server backend. 
export async function api_get(path) {
    let text = await fetch("http://localhost:4000/api/v1" + path, {});
    let resp = await text.json();
    return resp.data;
}

// Post request to server backend
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

// Fetching the latest leaderboard rankings for artists
export function fetch_leaderboard() {
    api_get("/leaderboard").then((data) => store.dispatch({
        type: 'leaderboard/set',
        data: data,
    }));
}

// Getting all of the users of the app
export function fetch_user() {
    api_get("/users").then((data) => store.dispatch({
        type: 'users/set',
        data: data,
    }));
}

// Getting all artists that are available to the application
export function fetch_artist() {
    api_get("/artist").then((data) => store.dispatch({
        type: 'artist/set',
        data: data,
    }));
}

// Gets the list of artists that are being followed by users
export function fetch_following_artist() {
    api_get("/following_artist").then((data) => store.dispatch({
        type: 'following_artist/set',
        data: data,
    }));
}

// Keeping track of user sessions
export function api_login(email, password) {
  api_post("/session", {email, password}).then((data) => {
    if (data.session) {
      let action = {
        type: 'session/set',
        data: data.session,
      }
      store.dispatch(action);
    }
    else if (data.error) {
      let action = {
        type: 'error/set',
        data: data.error,
      };
      store.dispatch(action);
    }
  });
}

// Creating a new user via post request
export function create_user(user) {
  return api_post("/users", {user});
}

// Creating a new artist via post request. 
export function create_artist(artist) {
  return api_post("/artist", {artist});
}

// Loading all of the default values into Redux store 
export function load_defaults() {
    fetch_leaderboard();
    fetch_user();
    fetch_artist();
}
