import mysql from 'mysql2'
import ApiError from '../utils/ApiError.js'

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
<<<<<<< HEAD
  password: 'Ashutosh@2003',
  database: 'commondb1',
=======
  password: 'Harita2*',
  database: 'commonDB1',
>>>>>>> 91d4c4e7b407ac22f13a9b5c147a115804d25ee8
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
