import { Container } from 'react-bootstrap';
import { Switch, Route } from 'react-router-dom';

import "./App.scss";

import Leaderboard from "./leaderboard";
import User from "./User";
import Artist from "./Artist";
import Generator from "./generator";
import CreateUser from "./CreateUser";
import CreateArtist from "./CreateArtist";
import Nav from "./nav";

function App() {
  return (
    <Container>
      <Nav />
      <Switch>
        <Route path="/" exact>
          <h1>Boombox</h1>
        </Route>
        <Route exact path="/leaderboard">
          <Leaderboard />
        </Route>
        <Route exact path="/users">
          <User />
        </Route>
        <Route exact path="/artist">
          <Artist />
        </Route>
        <Route exact path="/generator">
          <Generator />
        </Route>
        <Route exact path="/users/create">
          <CreateUser />
        </Route>
        <Route exact path="/artist/create">
          <CreateArtist />
        </Route>
      </Switch>
    </Container>
  )
}

export default App;
