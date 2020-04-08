import React, { Component } from "react";
import { BrowserRouter as Router } from "react-router-dom";
import SingOutButton from "./signOutButton/SingOutButton";
import { GlobalContext } from "./context/GlobalContext";

class App extends Component {
  render() {
    return (
      <GlobalContext.Consumer>
        {userStatus => {
          return (
            <>
            {console.log('GlobalContext', GlobalContext)}
              <SingOutButton />
              {/* <Router>{userStatus.routing}</Router> */}
            </>
          );
        }}
      </GlobalContext.Consumer>
    );
  }
}

export default App;
