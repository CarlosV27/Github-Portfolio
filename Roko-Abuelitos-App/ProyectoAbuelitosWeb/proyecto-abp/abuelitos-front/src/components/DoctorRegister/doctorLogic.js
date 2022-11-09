import React from "react";
import NavbarDoctor from "../NavbarDoctor/NavbarDoctor";

// make a function that returns a componen

const DoctorRegister = (props) => {
    return(
        <div>
            <NavbarDoctor handleLogout={props.handleLogout} />
            <section>
                <h1>This is the doctor logics </h1>
            </section>
        </div>
    );
};

export default DoctorRegister;
