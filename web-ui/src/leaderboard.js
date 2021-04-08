import { connect } from 'react-redux';

 function Leaderboard({leaderboard}) {
    return (
        <div>
            <ul>
                {leaderboard.map((ll) => (<li key={ll.id}>{ll.id}  {ll.count}</li>))}
            </ul>
        </div>
    );
}

export default connect(({leaderboard}) => ({leaderboard}))(Leaderboard);