const request = require('supertest')
const expect = require('chai').expect
const server = require('../server')

describe("api/groups", () => {
  describe("GET /", () => {
    it("should return 400 if group name not provided", async() => {
      const res = await request(server).get("/api/groups")
      expect(res.status).to.equal(400)
    })
    it("should return group details along with list of students assigned to group", async() => {
      const res = await request(server).get("/api/groups?name=TS1")
      expect(res.status).to.equal(200)
      expect(res.body.group_name).to.equal('TS1')
      expect(res.body.course_code).to.equal('CZ3002')
      expect(res.body.students.length).to.equal(17)
    })
  })
})