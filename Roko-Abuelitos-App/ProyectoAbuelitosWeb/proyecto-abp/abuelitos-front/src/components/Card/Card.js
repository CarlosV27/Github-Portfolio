import React from "react";
import { Link } from 'react-router-dom'; 
import './Card.css';

const Card = (props) => {
    return(
        <div className="card">
            <p className="card-initial-paragraph">{props.cardInitialParagraph}</p>
            <div className="card-content-container">
                <h2 className='card-title'>{props.cardTitle}</h2>
                <Link to={props.linkTo} className="card-link">Entra aquí</Link>
            </div>
        </div>
    );
}

export default Card;