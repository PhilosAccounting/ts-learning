import React, { Component }  from 'react';

class Counter extends Component {
  constructor(props) {
    super(props);

    this.state = {
      count: props.initialCount
    };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState({
      count: this.state.count + 1
    });
  }

  render() {
    return (
      <div>
        {this.state.count}
        <button onClick={this.handleClick}>+</button>
      </div>
    );
  }
}

export default Counter;
