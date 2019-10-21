const request = require('supertest')
const expect = require('chai').expect
const server = require('../server')

describe("api/pushNotif", () => {
  describe("POST /emailAlert", () => {
    it("should return 200 if email sent successfully", async() => {
      const res = await request(server)
        .post("/api/pushNotif/emailAlert")
        .send({
          recipients: ["joshenlimek@gmail.com"],
          subject: "Test Notification from FI-AR",
          messageHTML: "<p>Test Email from test suite</p>"
        })
      expect(res.status).to.equal(200)
      expect(res.body.message).to.equal('success')
    })
  })
})