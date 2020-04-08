import React, { lazy, Suspense } from "react";
import { connect } from "react-redux";
import { Route, Switch } from "react-router-dom";

const LazyLogin = lazy(() =>
  import("../pages/loginPage/LoginPage" /* webpackChunkName: 'Login' */)
);

const LazyRegistration = lazy(() =>
  import(
    "../pages/registrationPage/RegistrationPage" /* webpackChunkName: 'Registration' */
  )
);

const LazyHome = lazy(() =>
  import("../pages/homePage/HomePage" /* webpackChunkName: 'Home' */)
);

const authStatus = this.props.isAuthenticated;

const useRouter = authStatus => {
  if (authStatus) {
    return (
      <Suspense fallback={<div>Loading...</div>}>
        <Switch>
          <Route exact path="/home" component={LazyHome} />
        </Switch>
      </Suspense>
    );
  }
  return (
    <>
      <Suspense fallback={<div>Loading...</div>}>
        <Switch>
          <Route exact path="/login" component={LazyLogin} />
          <Route exact path="/registration" component={LazyRegistration} />
        </Switch>
      </Suspense>
    </>
  );
};

const mapSTP = (state) => ({ isAuthenticated: state.isAuthenticated });

export default connect(mapSTP)(useRouter);
