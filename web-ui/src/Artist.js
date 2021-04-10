import { connect } from 'react-redux';
import { Button } from 'react-bootstrap';

 function Artist({artist}) {
    return (
        <div>
            <ul>
                {artist.map((ll) => (<li key={ll.id}><Button>{ll.name}</Button><p><br/></p></li>))}
            </ul>
        </div>
    );
}

export default connect(({artist}) => ({artist}))(Artist);
