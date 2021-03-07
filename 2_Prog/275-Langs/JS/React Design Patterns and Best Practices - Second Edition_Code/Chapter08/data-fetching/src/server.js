import express from 'express';
import React from 'react';
import ReactDOM from 'react-dom/server';
import fetch from 'isomorphic-fetch';
import App from './App';
import Template from './template';

const app = express();

app.use(express.static('dist/public'));

app.get('/', (req, res) => {
  fetch('https://api.github.com/users/gaearon/gists')
    .then(response => response.json())
    .then(gists => {
      const body = ReactDOM.renderToString(<App gists={gists} />);
      const html = Template(body, gists);

      res.send(html);
    });
})

app.listen(3000, () => {
  console.log('Listening on port 3000');
});
