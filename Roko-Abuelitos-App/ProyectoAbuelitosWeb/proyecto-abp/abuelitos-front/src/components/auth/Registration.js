import React, { Component } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

import abuelita1 from "../../images/abuelita-1.png";
import "./Registro.css";

import logo from '../../images/logo.png';

export default class Registration extends Component {
  constructor(props) {
    super(props);

    this.state = {
      email: "",
      password: "",
      password_confirmation: "",
      name: "",
      age: "",
      gender: "",
      city: "",
      state: "",
      is_type: "",
      registrationErrors:
        "There was an error with your registration. Please try again or contact with us.",
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSuccessfulAuthAdmin = this.handleSuccessfulAuthAdmin.bind(this);
    this.handleSuccessfulAuthDoctor =
      this.handleSuccessfulAuthDoctor.bind(this);
    this.handleSuccessfulAuthUser = this.handleSuccessfulAuthUser.bind(this);
  }

  handleSuccessfulAuthAdmin(data) {
    // TODO's -> update parent component
    this.props.handleLogin(data); // this is the function that is called from rails api
    this.props.history.push("/dashboard"); // this is the route we set up in the backend
  }

  handleSuccessfulAuthDoctor(data) {
    // TODO's -> update parent component
    this.props.handleLogin(data); // this is the function that is called from rails api
    this.props.history.push("/doctor"); // this is the route we set up in the backend
  }

  handleSuccessfulAuthUser(data) {
    // TODO's -> update parent component
    this.props.handleLogin(data); // this is the function that is called from rails api
    this.props.history.push("/user"); // this is the route we set up in the backend
  }

  handleChange(event) {
    // this is the function that is called from rails api
    console.log(event.target.name)
    console.log(event.target.value)
    this.setState({
      [event.target.name]: event.target.value,
    });
  }

  handleSubmit(event) {
    // this is the function that is called from rails api
    const {
      email,
      password,
      password_confirmation,
      name,
      age,
      gender,
      city,
      state,
      is_type,
    } = this.state;

    axios
      .post(
        "http://localhost:3001/registrations", // this is the route we set up in the backend
        {
          user: {
            email: email,
            password: password,
            password_confirmation: password_confirmation,
            name: name,
            age: age,
            gender: gender,
            city: city,
            state: state,
            is_type: is_type,
          },
        },
        { withCredentials: true }
      )
      .then((response) => {
        if (response.data.status === "created") {
          console.log("registration successful");
          let currentUser = response.data.user.email;
          
          let checkAdmin = currentUser.search(/admin@iepam.com/);
          let checkDoctor = currentUser.search(/@iepam.com/);
      
          if (checkAdmin != -1) {
            console.log("admin");
            this.handleSuccessfulAuthAdmin(response.data);
          } else if (checkDoctor != -1) {
            this.handleSuccessfulAuthDoctor(response.data);
            console.log("doctor");
          } else {
            this.handleSuccessfulAuthUser(response.data);
            console.log("user");
          }          
        }
        console.log("login successful");
      })
      .catch((error) => {
        console.log("registration error", error);
      });
    event.preventDefault();
  }

  render() {
    return (
      <section id="registro-section">
        <div className="registro-decoration">
          <span className="circle circle-top"></span>
          <span className="circle circle-bottom"></span>
          <span className="line line-top"></span>
          <span className="line-up line-center1"></span>
          <span className="line-up line-center2"></span>
          <span className="square square-center"></span>
          <div className="inicio-sesion-img-container">
            <img
              src={abuelita1}
              alt="Foto de una persona adulto mayor"
              width="100%"
            />
          </div>
        </div>
        <div className="registro-content">
          <div className="registro-navbar">
            <div className="logo-container">
              <Link to="/">
                <img id="logo" src={logo} />
              </Link>
            </div>
            <nav className="registro-nav-menu">
              <ul>
                <li>
                  <Link to="/inicio-sesion" className="link">
                    Iniciar Sesión
                  </Link>
                </li>
                <li>
                  <Link to="/registro" className="link" id="registro-active">
                    Registrarse
                  </Link>
                </li>
              </ul>
            </nav>
          </div>

          <div className="form-section">
            <div className="form-content">
              <h2>Registrate</h2>
              <p>Ingresa los datos que se te solicitan para crear tu perfil</p>
              <form onSubmit={this.handleSubmit}>
                <div>
                  <label htmlFor="correo">Correo:</label>
                  <input
                    id="correo"
                    name="email"
                    type="email"
                    placeholder="Ej. tucorreo@email.com..."
                    value={this.state.email}
                    onChange={this.handleChange}
                    required
                  />
                </div>

                <div>
                  <label htmlFor="contraseña">Contraseña:</label>
                  <input
                    id="contraseña"
                    name="password"
                    type="password"
                    placeholder="Contraseña..."
                    value={this.state.password}
                    onChange={this.handleChange}
                    required
                  />
                </div>

                <div>
                  <label htmlFor="confirma-contraseña">
                    Confirma contraseña:
                  </label>
                  <input
                    id="confirma-contraseña"
                    name="password_confirmation"
                    type="password"
                    placeholder="Confirma tu contraseña..."
                    value={this.state.password_confirmation}
                    onChange={this.handleChange}
                    required
                  />
                </div>

                <div>
                  <label htmlFor="nombre">Nombre:</label>
                  <input
                    id="nombre"
                    name="name"
                    type="text"
                    placeholder="Escribe tu nombre..."
                    value={this.state.name}
                    onChange={this.handleChange}
                    required
                  />
                </div>

                <div>
                  <label htmlFor="edad">Edad:</label>
                  <input
                    id="edad"
                    name="age"
                    type="text"
                    placeholder="Escribe tu edad..."
                    value={this.state.age}
                    onChange={this.handleChange}
                    required
                  />
                </div>

                <div>
                  <label htmlFor="genero">Género:</label>
                  <input
                    id="genero"
                    name="gender"
                    type="text"
                    placeholder="Escribe tu genero... (Masculino o Femenino)"
                    value={this.state.gender}
                    onChange={this.handleChange}
                    required
                  />
                </div>
                <div>
                  <label htmlFor="ciudad">Ciudad:</label>
                  <input
                    id="ciudad"
                    name="city"
                    type="text"
                    placeholder="Escribe ciudad en donde vives..."
                    value={this.state.city}
                    onChange={this.handleChange}
                    required
                  />
                </div>
                <div>
                  <label htmlFor="estado">Estado:</label>
                  <input
                    id="estado"
                    name="state"
                    type="text"
                    placeholder="Confirma tu contraseña..."
                    value={this.state.state}
                    onChange={this.handleChange}
                    required
                  />
                </div>              
                <div> 
                  <label>¿Doctor o Paciente?</label>
                  <div className="radio-btns-container">
                    <input
                      id="is_doctor"   
                      className="radio-btns"                   
                      name="is_type"
                      type="radio"
                      value="doctor"
                      onChange={this.handleChange}
                      required
                    />
                    <label htmlFor="is_doctor" id="radio-label">Doctor</label>
                  </div>
                  
                  <div className="radio-btns-container">
                    <input
                      id="is_pacient"
                      className="radio-btns"
                      name="is_type"
                      type="radio"
                      value="paciente"                    
                      onChange={this.handleChange}   
                      required
                    />
                    <label htmlFor="is_pacient" id="radio-label">Paciente</label>              
                  </div>
                </div>                      
                <div className="registro-btns">
                  <button id="registro-btn" type="submit">
                    Crear cuenta
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
    );
  }
}
