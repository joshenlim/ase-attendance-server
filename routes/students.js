const pool = require('../database')
const express = require('express')
const router = express.Router()

router.get('/', function (req, res) {
  const matric = req.query.matric
  const group = req.query.group

  if (!matric || !group) {
    res.status(400).send('Matric and Group name required')
  }

  pool.query(`SELECT students.matric, students.name, group_name, email, seat FROM students LEFT JOIN student_group ON student_group.matric = students.matric WHERE students.matric = '${matric}' AND group_name = '${group}';`, function (err, result) {
    // if (err) throw new Error(err)
    const data = result[0]
    res.json(data)
  })
})

router.post('/updateAttendance', function(req, res) {
  const matric = req.body.matric
  const group = req.body.group
  const session = req.body.session
  const status = req.body.status

  pool.query(`SELECT attendance FROM student_group WHERE matric = '${matric}' AND group_name = '${group}'`, function(err, result) {
    const studentAttendance = JSON.parse(result[0].attendance);

    if (studentAttendance[`session_${session}`] == status) {
      res.json({
        "message": "statusNoChange"
      })
    } else {
      studentAttendance[`session_${session}`]  = status;
      pool.query(`UPDATE student_group SET attendance = '${JSON.stringify(studentAttendance)}' WHERE matric = '${matric}' AND group_name = '${group}'`, function(err, result) {
        res.json({
          "message": "success"
        })
      })
    }
  })
})

module.exports = router