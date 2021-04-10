// Based on code from Nat Tuck's Lecture 19 code. 
import { createStore, combineReducers } from 'redux';

function leaderboard(state = [], action) {
    switch (action.type) {
    case 'leaderboard/set':
        return action.data;
    default:
        return state;
    }
}

function users(state = [], action) {
    switch (action.type) {
    case 'users/set':
        return action.data;
    default:
        return state;
    }
}

function artist(state = [], action) {
    switch (action.type) {
    case 'artist/set':
        return action.data;
    default:
        return state;
    }
}

function save_session(sess) {
  let session = Object.assign({}, sess, {time: Date.now()});
  localStorage.setItem("session", JSON.stringify(session));
}

function restore_session() {
  let session = localStorage.getItem("session");
  if (!session) {
    return null;
  }
  session = JSON.parse(session);
  let age = Date.now() - session.time;
  let hours = 60 * 60 * 1000;
  if (age < 24 * hours) {
    return session;
  }
  else {
    return null;
  }
}

function session(state = restore_session(), action) {
  switch (action.type) {
    case 'session/set':
      save_session(action.data);
      return action.data;
    case 'session/clear':
      return null;
    default:
      return state;
  }
}

function root_reducer(state, action) {
    let reducer = combineReducers({
        leaderboard, users, artist
    });
    return reducer(state, action);
}

let store = createStore(root_reducer);
export default store;
