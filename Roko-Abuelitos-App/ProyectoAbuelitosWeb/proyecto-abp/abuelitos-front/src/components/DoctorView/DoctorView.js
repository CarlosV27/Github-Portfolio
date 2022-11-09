import React from "react";
import { Link } from "react-router-dom";
import NavbarDoctor from "../NavbarDoctor/NavbarDoctor";

import "./DoctorView.css";

const DoctorView = (props) => {
  return (
    <div>
      <NavbarDoctor handleLogout={props.handleLogout} />
      <section className="doctor-section">
        <h1>¡Bienvenido doctor!</h1>
        <div className="tabla-pacientes-container">
          <h2>Tus pacientes</h2>

          {/* generate a table with all pacient data */}
          <table className="tabla-pacientes">
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Edad</th>
                <th>Sexo</th>
                <th>Peso</th>
                <th>Altura</th>
                <th>IMC</th>
                <th>Presión arterial</th>
                <th>Tipo de sangre</th>
                <th>Enfermedades</th>
                <th>Medicamentos</th>
                <th>CP</th>
                <th>Ciudad</th>
                <th>Estado</th>
                <th>Fecha de registro</th>
                <th>¿Registrar paciente?</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Alfonso</td>
                <td>Guajardo</td>
                <td>77</td>
                <td>Masculino</td>
                <td>80</td>
                <td>1.80</td>
                <td>24.69</td>
                <td>120/80</td>
                <td>O+</td>
                <td>Diabetes</td>
                <td>Insulina</td>
                <td>64391</td>
                <td>Monterrey</td>
                <td>Nuevo León</td>
                <td>20/10/12</td>
                <td>
                  <div className="registro-btn-container">
                    <a
                      href="http://127.0.0.1:5500/html-video-to-image/02-image-to-video.html"
                      className="registro-paciente-btn"
                    >
                      Registro
                    </a>
                  </div>
                </td>
              </tr>

              <tr>
                <td>Odilia</td>
                <td>Guajardo</td>
                <td>87</td>
                <td>Femenino</td>
                <td>60</td>
                <td>1.60</td>
                <td>23.44</td>
                <td>120/80</td>
                <td>O-</td>
                <td>Diabetes</td>
                <td>Insulina</td>
                <td>43901</td>
                <td>Monterrey</td>
                <td>Nuevo León</td>
                <td>20/10/12</td>
                <div className="registro-btn-container">
                  <a
                    href="http://127.0.0.1:5500/html-video-to-image/02-image-to-video.html"
                    className="registro-paciente-btn"
                  >
                    Registro
                  </a>
                </div>
              </tr>

              <tr>
                <td>Miguel</td>
                <td>Pedraza</td>
                <td>53</td>
                <td>Masculino</td>
                <td>80</td>
                <td>1.69</td>
                <td>22.45</td>
                <td>120/80</td>
                <td>O-</td>
                <td>Demencia</td>
                <td>Donepezilo</td>
                <td>64989</td>
                <td>Monterrey</td>
                <td>Nuevo León</td>
                <td>20/10/12</td>
                <div className="registro-btn-container">
                  <a
                    href="http://127.0.0.1:5500/html-video-to-image/02-image-to-video.html"
                    className="registro-paciente-btn"
                  >
                    Registro
                  </a>
                </div>
              </tr>

              <tr>
                <td>Segio</td>
                <td>Chávez</td>
                <td>71</td>
                <td>Masculino</td>
                <td>75</td>
                <td>1.79</td>
                <td>21.05</td>
                <td>115/80</td>
                <td>A+</td>
                <td>Colesterol</td>
                <td>Rosuvastatina</td>
                <td>64989</td>
                <td>Monterrey</td>
                <td>Nuevo León</td>
                <td>20/10/12</td>
                <div className="registro-btn-container">
                  <a
                    href="http://127.0.0.1:5500/html-video-to-image/02-image-to-video.html"
                    className="registro-paciente-btn"
                  >
                    Registro
                  </a>
                </div>
              </tr>

              <tr>
                <td>Mayela</td>
                <td>Aguilar</td>
                <td>50</td>
                <td>Femenino</td>
                <td>50</td>
                <td>1.67</td>
                <td>23.08</td>
                <td>115/80</td>
                <td>A-</td>
                <td>NA</td>
                <td>NA</td>
                <td>64989</td>
                <td>Monterrey</td>
                <td>Nuevo León</td>
                <td>20/10/12</td>
                <div className="registro-btn-container">
                  <a
                    href="http://127.0.0.1:5500/html-video-to-image/02-image-to-video.html"
                    className="registro-paciente-btn"
                  >
                    Registro
                  </a>
                </div>
              </tr>

              <tr>
                <td>Paulina</td>
                <td>López</td>
                <td>81</td>
                <td>Femenino</td>
                <td>78</td>
                <td>1.60</td>
                <td>22.18</td>
                <td>115/80</td>
                <td>AB+</td>
                <td>Alzheimer</td>
                <td>Aricept</td>
                <td>43901</td>
                <td>Monterrey</td>
                <td>Nuevo León</td>
                <td>20/10/12</td>
                <div className="registro-btn-container">
                  <a
                    href="http://127.0.0.1:5500/html-video-to-image/02-image-to-video.html"
                    className="registro-paciente-btn"
                  >
                    Registro
                  </a>
                </div>
              </tr>

              <tr>
                <td>Pedro</td>
                <td>Hernández</td>
                <td>41</td>
                <td>Masculino</td>
                <td>90</td>
                <td>1.90</td>
                <td>31.28</td>
                <td>120/80</td>
                <td>AB-</td>
                <td>Obesidad</td>
                <td>Liraglutida</td>
                <td>64229</td>
                <td>Monterrey</td>
                <td>Nuevo León</td>
                <td>20/10/12</td>
                <div className="registro-btn-container">
                  <a
                    href="http://127.0.0.1:5500/html-video-to-image/02-image-to-video.html"
                    className="registro-paciente-btn"
                  >
                    Registro
                  </a>
                </div>
              </tr>
            </tbody>
          </table>
        </div>
        {/* <div className="registro-pacientes-container">
                    <h2>¿Registrar paciente?</h2>
                    <div className="registro-btn-container">
                        <a href="http://127.0.0.1:5500/html-video-to-image/02-image-to-video.html" className="registro-paciente-btn">Registro</a>
                    </div>
                </div> */}
      </section>
    </div>
  );
};

export default DoctorView;
