express = require 'express'
sql = require 'sqlite3'
app = express()
app.set 'view engine', 'jade' # Let's use JADE
app.set 'views', 'views' # jade templates in the views folder
app.use('/static', express.static(__dirname+'/static'))
app.use(express.bodyParser())

db = new sql.Database 'database.db'

app.get '/', (req, res) ->
  res.render 'home'


app.post '/post', (req, res) ->
  names = JSON.parse(req.body.payload)
  date = new Date().toISOString()
  for name in names
    db.run "insert into lang values ('#{date}', '#{name}')"
  res.send '{ "return": 0 }'

app.listen 3000, () -> console.log 'Listening on port 3000'
