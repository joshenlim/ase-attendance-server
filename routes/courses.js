const pool = require('../database')
const express = require('express')
const router = express.Router()

router.get('/', function (req, res) {
  const courseCode = req.query.search.toUpperCase()
  pool.query(`SELECT code, name, group_name FROM courses LEFT JOIN groups ON groups.course_code = courses.code WHERE code LIKE '%${courseCode}%'`, function (err, result, fields) {
    if (err) throw new Error(err)

    let formattedCourseData = []
    result.forEach(course_data => {
      if (formattedCourseData.some(course => course.code == course_data.code)) {
        formattedCourseData.filter(course => course.code == course_data.code)[0].groups.push(course_data.group_name)
      } else {
        formattedCourseData.push({
          code: course_data.code,
          name: course_data.name,
          groups: course_data.group_name ? [course_data.group_name] : []
        })
      }
    })

    formattedCourseData.sort((a, b) => {
      if (parseInt(a.code.slice(-4)) > parseInt(b.code.slice(-4))) { return 1 }
      else { return -1 }
    })
    
    res.json(formattedCourseData)
  })
})

module.exports = router