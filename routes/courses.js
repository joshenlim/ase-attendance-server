const express = require('express')
const router = express.Router()

// Mock data import
const courses = require('../data/courses')

router.get('/', function (req, res) {
  const courseCode = req.query.search.toUpperCase()
  const filteredCourses = courses.courses.filter(course => {
    return course.code.indexOf(courseCode) !== -1
  }).slice(0, 10)
  res.json(filteredCourses)
})

module.exports = router