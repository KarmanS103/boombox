import { createStore, combineReducers } from 'redux';

function leaderboard(state = [], action) {
    switch (action.type) {
    case 'leaderboard/set':
        return action.data;
    default:
        return state;
    }
}

function root_reducer(state, action) {
    console.log("root_reducer", state, action);
    let reducer = combineReducers({
        leaderboard
    });
    return reducer(state, action);
}

let store = createStore(root_reducer);
export default store;