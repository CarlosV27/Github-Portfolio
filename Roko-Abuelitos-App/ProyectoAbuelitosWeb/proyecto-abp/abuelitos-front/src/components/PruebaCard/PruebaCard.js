import React from 'react';
import './PruebaCard.css';

const PruebaCard = (props) => {
    return(
        <div className="prueba-card">
            <div className="prueba-card-header">
                <h2>{props.pruebaCardTitle}</h2>
            </div>
            <div className="prueba-card-content">
                <div className="prueba-results">
                    <h3 className="card-content-title">Resultado:</h3>
                    <p>Positivo</p>
                </div>
                <div className="prueba-results">
                    <h3 className="card-content-title">Puntaje Esfera:</h3>
                    <p>0 puntos</p>
                </div>
                <div className="prueba-results">
                    <h3 className="card-content-title">Puntaje Números</h3>
                    <p>2 puntos</p>
                </div>
                <div className="prueba-results">
                    <h3 className="card-content-title">Puntaje Manecillas</h3>
                    <p>1 punto</p>
                </div>
            </div>
        </div>
    );
}

export default PruebaCard;