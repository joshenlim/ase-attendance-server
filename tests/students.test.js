const request = require('supertest')
const expect = require('chai').expect
const server = require('../server')

describe("api/students", () => {
  describe("GET /", () => {
    it("should return 400 if matric or group name not provided", async() => {
      const res = await request(server).get("/api/students")
      expect(res.status).to.equal(400)
    })
    it("should return student profile if matric and group name given", async() => {
      const res = await request(server).get("/api/students?matric=U1722911C&group=TS1")
      expect(res.status).to.equal(200)
      expect(res.body.matric).to.equal('U1722911C')
      expect(res.body.group_name).to.equal('TS1')
    })
  })
  describe("POST /updateAttendance", () => {
    it("should update student attendance status for a particular course and group", async() => {
      const res = await request(server)
        .post("/api/students/updateAttendance")
        .send({
          matric: "U1722911C",
          group: "TS1",
          session: 1,
          status: 1
        })
      expect(res.status).to.equal(200)
      expect(res.body.message).to.equal('success')
    })
    it("should return no change if attendance status update was the same as before", async() => {
      const res = await request(server)
        .post("/api/students/updateAttendance")
        .send({
          matric: "U1722911C",
          group: "TS1",
          session: 1,
          status: 1
        })
      expect(res.status).to.equal(200)
      expect(res.body.message).to.equal('statusNoChange')
    })
    it("should update student attendance status for a particular course and group", async() => {
      const res = await request(server)
        .post("/api/students/updateAttendance")
        .send({
          matric: "U1722911C",
          group: "TS1",
          session: 1,
          status: 0
        })
      expect(res.status).to.equal(200)
      expect(res.body.message).to.equal('success')
    })
  })
})