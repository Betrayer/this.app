import React, { lazy, Suspense } from "react";
import { Route, Switch, Redirect } from "react-router-dom";
import HomePage from "./pages/homePage/HomePage";
import TodoList from "./todoList/TodoList";

const LazyLogin = lazy(() =>
  import("./pages/loginPage/LoginPage" /* webpackChunkName: 'Login' */)
);

const LazyRegistration = lazy(() =>
  import(
    "./pages/registrationPage/RegistrationPage" /* webpackChunkName: 'Registration' */
  )
);

export const useRouter = isAuthenticated => {
  if (isAuthenticated) {
    return (
      <Switch>
        <Route exact path="/home">
          <HomePage />
        </Route>
        {/* <Route path="/home/todo">
            <>
              <TodoList />
            </>
          </Route> */}
        <Redirect to="/home" />
      </Switch>
    );
  }

  return (
    <>
      <Suspense fallback={<div>Loading...</div>}>
        <Switch>
          <Route path="/login">
            <LazyLogin />
          </Route>
          <Route path="/registration">
            <LazyRegistration />
          </Route>
          <Redirect to="/login" />
        </Switch>
      </Suspense>
    </>
  );
};
