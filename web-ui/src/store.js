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

function root_reducer(state, action) {
    console.log("root_reducer", state, action);
    let reducer = combineReducers({
        leaderboard, users, artist
    });
    return reducer(state, action);
}

let store = createStore(root_reducer);
export default store;
