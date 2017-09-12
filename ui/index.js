require('./index.html');
require('./style.css')

const Elm = require('./Main.elm');

const app = Elm.Main.embed(document.getElementById('main'));
