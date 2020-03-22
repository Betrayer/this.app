import React, { Component } from "react";
import firebase from "./config";
import { BrowserRouter as Router } from "react-router-dom";
import { useRouter } from "./router";

class App extends Component {
  state = { userStatus: null };

  componentDidMount() {
    this.onStateChanged();
  }

  onStateChanged = async () => {
    await firebase.auth().onAuthStateChanged(user => {
      this.setState({ userStatus: user });
    });
  };

  signOut = () => {
    firebase.auth().signOut();
  };

  render() {
    const { userStatus } = this.state;
    const routing = useRouter(false);
    return (
      <>
        {userStatus && (
          <button onClick={this.signOut}>
            Sign out from {userStatus.email}
          </button>
        )}
        <Router>{routing}</Router>
      </>
    );
  }
}

// const App = () => (
//   <>
//     <Switch>
//       <Route exact path="/" component={LoginPage} />

//       <Route path="/signIn" component={RegistrationPage} />
//       <Redirect to="/" />
//     </Switch>
//     <NavLink exact to="/">
//       Login
//     </NavLink>
//     <span> -=-=-=-=-=-=-=-=- </span>
//     <NavLink to="/signIn">Registration page</NavLink>

//     {/* <TodoList /> */}
//   </>
// );

export default App;
