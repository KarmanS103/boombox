import { connect } from 'react-redux';
import { Table } from 'react-bootstrap'

function Leaderboard({ leaderboard }) {
    var artist = ["Drake", "Justin Bieber", "Ariana Grade", "Selena Gomez"]
    let numbers = []
    for (let i = 0; i < leaderboard.length; i++) {
        let count = leaderboard[i]["count"]
        numbers.push(count)
    }
    numbers = numbers.sort()
    return (
        <div>
            <Table striped bordered hover width="100%">
                <thead>
                    <tr>
                        <th>Artist</th>
                        <th>Follower Count</th>
                    </tr>
                </thead>
                <tbody>
                    {leaderboard.map((ll) => (<tr>
                        <td>{artist[ll.id - 1]}</td>
                        <td>{numbers[ll.id - 1]}</td>
                    </tr>))}
                </tbody>
            </Table>
        </div>
    );
}

export default connect(({ leaderboard }) => ({ leaderboard }))(Leaderboard);