import { Container } from 'react-bootstrap';
import { Switch, Route } from 'react-router-dom';

import "./App.scss";

import Leaderboard from "./leaderboard";
import Generator from "./generator"
import Nav from "./nav";

function App() {
  return (
    <Container>
      <Nav />
      <Switch>
        <Route path="/" exact>
          <h1>Boombox</h1>
        </Route>
        <Route path="/leaderboard">
          <Leaderboard />
        </Route>
        <Route path="/generator">
          <Generator />
        </Route>
      </Switch>
    </Container>
  )
}

export default App;