import React from "react";
import LoginPage from "./pages/loginPage/LoginPage";
import SignInPage from "./pages/signInPage/SignInPage";
import { NavLink, Switch, Route, Redirect } from "react-router-dom";

// import TodoList from "./todoList/TodoList";

const App = () => (
  <>
    <NavLink exact to="/">
      Login
    </NavLink>
    <NavLink to="/signIn">Sign In</NavLink>
    <Switch>
      <Route exact path="/" component={LoginPage} />
      <Route path="/signIn" component={SignInPage} />
      <Redirect to="/" />
    </Switch>
    {/* <TodoList /> */}
  </>
);

export default App;
