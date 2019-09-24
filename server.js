const express = require('express')
const cors = require('cors')

const auth = require('./routes/auth')
const courses = require('./routes/courses')

const app = express()
const port = 3000

app.use(cors({ origin: 'http://localhost:8080' }));

app.use('/api/auth', auth)
app.use('/api/courses', courses)

app.get('/health', function (req, res) {
  res.json({ 'status': true })
})

app.listen(port, () => console.log(`Server running on port: ${port}`))