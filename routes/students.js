const pool = require('../database')
const express = require('express')
const router = express.Router()

router.get('/', function (req, res) {
  const matric = req.query.matric
  const group = req.query.group
  pool.query(`SELECT students.matric, students.name, group_name, seat FROM students LEFT JOIN student_group ON student_group.matric = students.matric WHERE students.matric = '${matric}' AND group_name = '${group}';`, function (err, result) {
    if (err) throw new Error(err)
    const data = result[0]
    res.json(data)
  })
})

module.exports = router