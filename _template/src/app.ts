import express from 'express'
import logger from 'morgan'
import indexRouter from './routes/index'

const app = express()

app.use(logger('dev'))
app.use(express.json())

app.use('/api/payment', indexRouter)

const PORT = 3000

app.listen(PORT, '0.0.0.0', () => {
  console.log('<T> API Engaged')
})
