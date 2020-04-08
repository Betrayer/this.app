import React from "react";
import { GlobalContext } from "../context/GlobalContext";
import css from "./singOutButton.module.css";

const SingOutButton = () => {
  return (
    <GlobalContext.Consumer>
      {userStatus => {
        return (
          <>
            {/* {userStatus.userStatus && (
              <button className={css.signOut} onClick={userStatus.signOut}>
                Sign out from {userStatus.email}
              </button>
            )} */}
          </>
        );
      }}
    </GlobalContext.Consumer>
  );
};

export default SingOutButton;
