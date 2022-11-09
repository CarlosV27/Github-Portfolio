import React from "react";
import Navbar from "../Navbar/Navbar";
import Footer from "../Footer/Footer";
import PruebaCard from "../PruebaCard/PruebaCard";
import './Pruebas.css';

const Pruebas = (props) => {
    return(
        <div>
            <Navbar handleLogout={props.handleLogout} />
            <section>
                <h1 className="pruebas-page-title">Mis pruebas</h1>
                <div className="pruebas-dimensiones-container">
                    <div className="pruebas-dimensiones-titles">
                        <h2 className="section-title pruebas-page-subtitle">Dimensión cognitiva</h2>
                        <h2 className="section-title pruebas-page-subtitle">Pruebas <span>2</span>/2</h2>
                    </div>
                    <div className="pruebas-slider-container">
                        <PruebaCard pruebaCardTitle="Prueba del Reloj" />                  
                    </div>

                    <div className="pruebas-dimensiones-titles">
                        <h2 className="section-title pruebas-page-subtitle">Dimensión Física</h2>
                        <h2 className="section-title pruebas-page-subtitle">Pruebas <span>0</span>/3</h2>
                    </div>
                    <div className="pruebas-slider-container">
                        <PruebaCard pruebaCardTitle="SARC-F" />                  
                    </div>
                </div>                
            </section>
            <Footer />
        </div>
    );
}

export default Pruebas;