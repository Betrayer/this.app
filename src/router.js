import React, { lazy, Suspense } from "react";
import { Route, Switch } from "react-router-dom";
import HomePage from "./components/pages/homePage/HomePage";
import TodoList from './components/todoList/TodoList'

const LazyLogin = lazy(() =>
  import("./components/pages/loginPage/LoginPage" /* webpackChunkName: 'Login' */)
);

const LazyRegistration = lazy(() =>
  import(
    "./components/pages/registrationPage/RegistrationPage" /* webpackChunkName: 'Registration' */
  )
);

export const useRouter = isAuthenticated => {
  if (isAuthenticated) {
    return (
      <Switch>
        <Route exact path="/home" component={HomePage} />
        <Route exact path="/home/todo" component={TodoList} />
      </Switch>
    );
  }

  return (
    <>
      <Suspense fallback={<div>Loading...</div>}>
        <Switch>
          <Route exact path="" component={LazyLogin} />
          <Route exact path="/this.app" component={LazyLogin} />
          <Route exact path="/registration" component={LazyRegistration} />
        </Switch>
      </Suspense>
    </>
  );
};
