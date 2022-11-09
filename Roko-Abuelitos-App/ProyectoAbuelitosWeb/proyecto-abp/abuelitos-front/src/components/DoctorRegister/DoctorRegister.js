import React from "react";
import NavbarDoctor from "../NavbarDoctor/NavbarDoctor";

import "./DoctorRegister.css";

const DoctorRegister = (props) => {
    return(
        <div>
            <NavbarDoctor handleLogout={props.handleLogout} />
            <section>
                <h1>Doctor register section </h1>
            </section>
        </div>
    );
};

export default DoctorRegister;