// Nav.js
import { Nav } from 'react-bootstrap';
import { NavLink } from 'react-router-dom';
import store from './store';
function Link({to, children}) {
  return (
    <Nav.Item>
      <NavLink to={to} exact className="nav-link" activeClassName="active">
        {children}
      </NavLink>
    </Nav.Item>
  );
}

export default function AppNav({session}) {
    function logout() {
        store.dispatch({type: 'session/clear'});
    }
    let loginBar = (
      <Nav className="ml-auto">
        <NavLink to="/login" className="nav-link">Login</NavLink>
        <NavLink to="/register" className="nav-link">Register</NavLink>
      </Nav>
    );
    if (session) {
        loginBar = (
      <Nav className="ml-auto">
        <p>Welcome Back</p>
        <Nav.Link onClick={logout} className="nav-link">Logout</Nav.Link>
      </Nav>
      );
    }
  return (
    <div>
      <Nav variant="pills">
        <Link to="/leaderboard">Leaderboard</Link>
        <Link to="/artist">User Feed</Link>
        <Link to="/generator">Lyrics Generator</Link>
        <NavLink to="/login" className="nav-link">Login</NavLink>
        <NavLink to="/register" className="nav-link">Register</NavLink>
      </Nav>
    </div>
  );
}
