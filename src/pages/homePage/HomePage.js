import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import css from './homePage.module.css'

class HomePage extends Component {
  state = {
    isActive: false
  };
  render() {
    return (
      <div className={css.homePageContainer}>
        <h2>this is homepage</h2>
        <p>
          Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo,
          voluptates! Placeat quo, itaque error officiis tenetur assumenda,
          deserunt delectus fugiat alias maxime adipisci, temporibus nemo hic
          modi eius saepe odit. Dignissimos nam repellendus earum voluptate rem
          laudantium aspernatur, autem iure sed error inventore doloremque minus
          tenetur aliquam quidem possimus. Excepturi minus accusantium dolore
          nihil illo. Eveniet dolor beatae tempora asperiores! Similique harum,
          magnam iure, obcaecati repudiandae possimus quis laboriosam nemo velit
          perferendis libero adipisci quod rerum laudantium veniam! Dolorum
          consequatur velit fugit placeat saepe voluptatem veniam sapiente iure
          molestias blanditiis? Necessitatibus blanditiis molestiae temporibus
          assumenda ad animi debitis doloremque repellendus, quae, neque magnam
          accusantium quas tempora, repudiandae quam saepe nesciunt? Esse quos
          nesciunt laudantium deserunt! Optio voluptatibus dolor earum odit?
          Assumenda nobis error mollitia officiis obcaecati dicta dolorum!
          Expedita sint, adipisci voluptates ad nemo obcaecati necessitatibus
          modi temporibus molestiae et numquam tempore. Inventore cum eos
          veritatis neque fuga ipsam rerum!
        </p>
      </div>
    );
  }
}

export default withRouter(HomePage);
