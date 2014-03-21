express = require 'express'
app = express()
app.set 'view engine', 'jade' # Let's use JADE
app.set 'views', 'views' # jade templates in the views folder


app.get '/', (req, res) ->
  res.send 'Hello World!'


app.listen 3000, () -> console.log 'Listening on port 3000'
