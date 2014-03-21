express = require 'express'
app = express()
app.set 'view engine', 'jade' # Let's use JADE
app.set 'views', 'views' # jade templates in the views folder
app.use('/static', express.static(__dirname+'/static'))


app.get '/', (req, res) ->
  res.render 'home'


app.listen 3000, () -> console.log 'Listening on port 3000'
