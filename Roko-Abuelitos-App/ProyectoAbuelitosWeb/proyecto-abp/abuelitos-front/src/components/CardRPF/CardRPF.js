import React from 'react';
import './CardRPF.css';

const CardRPF = (props) => {
    let cardContentFinal = "";
    if (props.hasObj === true) {
        const cardContentTitle = props.cardContent.title;
        const cardContentResult = props.cardContent.result;        
        cardContentFinal = (
            <div className="card-rpf-container">
                <p style={{fontWeight: 700}}>{cardContentTitle}</p>
                <p>{cardContentResult}</p>
            </div>
        );
    } else {        
        cardContentFinal =  (
            <div className="card-rpf-container">
                <p>{props.cardContent}</p>
            </div>
        );
    }

    return(
        <div className="card-rpf">
            <div className="card-rpf-header">
                <h2 className="card-rpf-title">{props.cardTitle}</h2>
            </div>
            {cardContentFinal}
        </div>
    );
}

export default CardRPF;