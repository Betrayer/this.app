import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import { connect } from "react-redux";
// import RegistrationPage from "./components/pages/registrationPage/RegistrationPage";
// import LoginPage from "./components/pages/loginPage/LoginPage";
import { useRouter } from "./components/router/router";

const App = (props) => {
  const routing = useRouter(props.isAuthenticated);
  console.log("props", props);
  return (
    <>
      {/* <RegistrationPage />
      <LoginPage /> */}
      <Router>{routing}</Router>
    </>
  );
};

const mapSTP = (state) => ({ isAuthenticated: state.isAuthenticated });

export default connect(mapSTP)(App);
