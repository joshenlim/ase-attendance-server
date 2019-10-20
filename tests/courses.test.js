const request = require('supertest')
const expect = require('chai').expect
const server = require('../server')

describe("api/courses", () => {
  describe("GET /", () => {
    it("should return all courses if no search string given", async() => {
      const res = await request(server).get("/api/courses")
      expect(res.status).to.equal(200)
      expect(res.body.length).to.equal(49)
    })
    it("should return all courses with course codes beginning with CZ10 if search string was CZ10", async() => {
      const res = await request(server).get("/api/courses?search=CZ10")
      expect(res.status).to.equal(200)
      expect(res.body.length).to.equal(7)
    })
    it("should return all courses with course codes beginning with CZ20 if search string was CZ20", async() => {
      const res = await request(server).get("/api/courses?search=CZ20")
      expect(res.status).to.equal(200)
      expect(res.body.length).to.equal(7)
    })
    it("should return all courses with course codes beginning with CZ30 if search string was CZ30", async() => {
      const res = await request(server).get("/api/courses?search=CZ30")
      expect(res.status).to.equal(200)
      expect(res.body.length).to.equal(7)
    })
    it("should return all courses with course codes beginning with CZ40 if search string was CZ40", async() => {
      const res = await request(server).get("/api/courses?search=CZ40")
      expect(res.status).to.equal(200)
      expect(res.body.length).to.equal(28)
    })
  })
})