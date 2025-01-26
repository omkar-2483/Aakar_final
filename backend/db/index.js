import mysql from 'mysql2'
import ApiError from '../utils/ApiError.js'

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Omkar@4660',
  database: 'aakarerp',
})

connection.connect((err) => {
  if (err) {
    console.log(new ApiError(500, 'Database connection failed.'))
    process.exit(1)
  } else {
    console.log('Connected to database as ID: ' + connection.threadId)
  }
})

export { connection }
