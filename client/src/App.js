import React from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

import './App.css';

import Fib from './fib'
import OtherPage from './otherPage'

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <p>CHANGED PAGE></p>
          <Link to="/">Home</Link>
          <Link to="/other-page">Other Page</Link>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/other-page" component={OtherPage} />
          </div>
        </header>
      </div>
    </Router>
  );
}

export default App;
