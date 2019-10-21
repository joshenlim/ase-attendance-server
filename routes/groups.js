const pool = require('../database')
const express = require('express')
const router = express.Router()

router.get('/', function (req, res) {
  if (!req.query.name) {
    res.status(400).send('Group name required')
  } else {
    const groupName = req.query.name
    pool.query(`SELECT course_code, name, group_name, venue, day, start_time, end_time FROM groups LEFT JOIN courses ON groups.course_code = courses.code where group_name = '${groupName}';`, function (err, result, fields) {
      // if (err) throw new Error(err)
      const data = result[0]
      pool.query(`SELECT students.matric, students.name, email, seat, attendance FROM student_group LEFT JOIN students on student_group.matric = students.matric where group_name = '${groupName}';`, function (err, result, fields) {
        // if (err) throw new Error(err)
        result.sort((a, b) => {
          if (a.seat > b.seat) { return 1 }
          else { return -1 }
        })
        data.students = result.map(student => {
          return {
            ...student,
            attendance: JSON.parse(student.attendance)
          }
        })
        res.json(data)
      })
    })
  }
})

module.exports = router