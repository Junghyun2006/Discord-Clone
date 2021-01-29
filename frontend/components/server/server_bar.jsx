import React from "react";
import ServerIndexItem from "./server_index_item";
import {Link} from 'react-router-dom'

class ServerBar extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount(){
        this.props.receiveCurrentUser(this.props.currentUser.id)
    }

    render() {

        const {currentUser, servers} = this.props;

        if (!servers) return null;

        const serverIndex = servers.map((server, i) => { 
            return (
                    <ServerIndexItem server={server} key={i}/>
                );
        })

        return (
                <div className="server-bar-holder">
                    <Link to='/@me' className="home-btn-container"><img className="home-btn" src={window.logo} /></Link>
                    <div className='bar-divider' />
                    <ul className="server-bar-index">
                        {serverIndex}
                    </ul>
                    <div className="add-server-btn-container"><p className="add-server-btn">+</p></div>
                    <div className='bar-divider' />
                </div>
        )

    }


} 

export default ServerBar;
