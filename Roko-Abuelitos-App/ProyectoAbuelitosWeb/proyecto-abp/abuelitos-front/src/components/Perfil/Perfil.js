import React from "react";
import Navbar from "../Navbar/Navbar";
import Footer from "../Footer/Footer";
import CardRPF from "../CardRPF/CardRPF";

import './Perfil.css';
import imagenPerfil from '../../images/imagen-perfil.png';

const Perfil = (props) => {
    return(
        <div>
            <Navbar handleLogout={props.handleLogout}/>
            <section>
                <div className="perfil-info-container">
                    <div className="perfil-image-container">
                        <img
                            width="200px"
                            src={imagenPerfil} 
                            alt="Imagen de usuario" 
                        />
                    </div>
                    <div className="perfil-info-content">
                        <h1 className="perfil-nombre">David López</h1>
                        <ul className="perfil-lista-info">
                            <li>Edad: <span>72 años</span></li>
                            <li>Sexo: <span>Hombre</span></li>
                            <li>Peso: <span>80 kg</span></li>
                            <li>Estatura: <span>1.75 m</span></li>
                        </ul>
                    </div>
                </div>
                <div className="perfil-ficha-media-container">
                    <h2 className="section-title">Ficha medica</h2>                    
                    <div className="cards-container">
                        <CardRPF hasObj={false} cardTitle="Padecimientos médicos" cardContent="Diabetes" />
                        <CardRPF hasObj={false} cardTitle="Alergias o reacciones" cardContent="Anitbióticos" />
                        <CardRPF hasObj={false} cardTitle="Medicamentos recetados" cardContent="Metformina" />
                        <CardRPF hasObj={false} cardTitle="Grupo sanguíneo" cardContent="O-" />
                        <CardRPF hasObj={false} cardTitle="Contacto(s) de emergencia" cardContent="Esposa: +52 81 1586 3679" />
                    </div>
                </div>
            </section>
            <Footer />
        </div>
    );
}

export default Perfil;