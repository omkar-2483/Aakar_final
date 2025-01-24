import mysql from 'mysql2'
import ApiError from '../utils/ApiError.js'

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'Ashutosh@2003',
  database: 'commondb1',
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
