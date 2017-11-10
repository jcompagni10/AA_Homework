import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {result: 0, val1: '', val2: ''}
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    
  }
  setNum1(e){
    let val = parseInt(e.currentTarget.value)
    this.setState({val1: val})
  }
  setNum2(e){
    let val = parseInt(e.currentTarget.value)
    this.setState({val2: val})
  }

  resetVals(){
    // this.setState({val1: '', val2: ""})
  }
  add(){
    let result = this.state.val1 + this.state.val2
    this.setState({result})
    this.resetVals()
  }
  subtract(){
    let result = this.state.val1 - this.state.val2
    this.setState({result})
    this.resetVals()
  }
  times(){
    let result = this.state.val1 * this.state.val2
    this.setState({result})
    this.resetVals()
  }
  divide(){
    let result = this.state.val1 / this.state.val2
    this.setState({result})
    this.resetVals()
  }

  // your code here
  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" value={this.state.val1.toString()} name="val1" onChange= {this.setNum1} />
        <input type="text" value={this.state.val2.toString()} name="val2" onChange= {this.setNum2}/>
        <br/>
        <input type="button" value="+" onClick={this.add}/>
        <input type="button" value="-" onClick={this.subtract.bind(this)}/>
        <input type="button" value="/" onClick={this.divide.bind(this)}/>
        <input type="button" value="*" onClick={this.times.bind(this)}/>
      </div>

    );
  }
}

export default Calculator;