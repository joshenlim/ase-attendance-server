const express = require('express')
const router = express.Router()
const nodemailer = require('nodemailer');

const GMAIL_USER = process.env.GMAIL_USER
const GMAIL_PASS = process.env.GMAIL_PASS
const sender = 'fiar@gmail.com'

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
         user: GMAIL_USER,
         pass: GMAIL_PASS
     }
 });

router.post('/emailAlert', function(req, res) {
  const recipients = req.body.recipients
  const subject = req.body.subject
  const message = req.body.messageHTML

  const mailOptions = {
    from: sender,
    to: recipients,
    subject: subject,
    html: message
  };

  transporter.sendMail(mailOptions, function (err, info) {
    // if(err)
    //   console.log(err)
    // else
    res.json({
      "message": "success"
    })
  });
})

module.exports = router