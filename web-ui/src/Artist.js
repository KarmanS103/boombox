import { connect } from 'react-redux';

 function Artist({artist}) {
    return (
        <div>
            <ul>
                {artist.map((ll) => (<li key={ll.id}>{ll.id}  {ll.name}</li>))}
            </ul>
        </div>
    );
}

export default connect(({artist}) => ({artist}))(Artist);
