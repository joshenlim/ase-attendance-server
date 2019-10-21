const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')

const auth = require('./routes/auth')
const courses = require('./routes/courses')
const groups = require('./routes/groups')
const students = require('./routes/students')
const email = require('./routes/email')

const app = express()
const port = 3000

app.use(cors({ origin: 'http://localhost:8080' }));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true })); 

app.use('/api/auth', auth)
app.use('/api/courses', courses)
app.use('/api/groups', groups)
app.use('/api/students', students)
app.use('/api/pushNotif', email)

app.get('/health', function (req, res) {
  res.json({ 'status': true })
})

app.listen(port, () => console.log(`Server running on port: ${port}`))

module.exports = app;