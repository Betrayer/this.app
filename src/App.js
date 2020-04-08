import React from "react";
import RegistrationPage from "./components/pages/registrationPage/RegistrationPage";
import LoginPage from "./components/pages/loginPage/LoginPage";
import { useRouter } from "./components/router/router";

const App = () => {
  return (
    <>
      <RegistrationPage />
      <LoginPage />
    </>
  );
};

export default App;
