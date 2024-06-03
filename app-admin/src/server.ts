import express from 'express'
import payload from 'payload'

require('dotenv').config()
const app = express()

app.use('/admin', (req, res, next) => {
  req.url = req.url.replace(/^\/admin/, '');
  next();
});

const start = async () => {
  // Initialize Payload
  await payload.init({
    secret: process.env.PAYLOAD_SECRET,
    express: app,
    onInit: async () => {
      payload.logger.info(`Payload Admin URL: ${payload.getAdminURL()}`)
    },
  })

  // Add your own express routes here

  app.listen(3000)
}

start()
