const request = require('supertest')
const expect = require('chai').expect
const server = require('../server')

describe("api/auth", () => {
  describe("GET /", () => {
    it("should return 200 if authentication successful", async() => {
      const res = await request(server).get("/api/auth")
      expect(res.status).to.equal(200)
    })
  })
})