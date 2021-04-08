import { connect } from 'react-redux';

 function User({users}) {
    return (
        <div>
            <ul>
                {users.map((ll) => (<li key={ll.id}>{ll.id}  {ll.email}</li>))}
            </ul>
        </div>
    );
}

export default connect(({users}) => ({users}))(User);
