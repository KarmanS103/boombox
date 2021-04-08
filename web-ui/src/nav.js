// Nav.js
import { Nav } from 'react-bootstrap';
import { NavLink } from 'react-router-dom';

function Link({to, children}) {
  return (
    <Nav.Item>
      <NavLink to={to} exact className="nav-link" activeClassName="active">
        {children}
      </NavLink>
    </Nav.Item>
  );
}

export default function AppNav() {
  return (
    <Nav variant="pills">
      <Link to="/leaderboard">Leaderboard</Link>
      <Link to="/feed">User Feed</Link>
      <Link to="/generator">Lyrics Generator</Link>
    </Nav>
  );
}