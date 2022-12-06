import { Handler } from '@netlify/functions'
import * as httpStatus from 'http-status'
import { MongoClient, MongoServerError } from 'mongodb'

// @ts-ignore
const client = new MongoClient(process.env.MONGODB_URI)
const clientPromise = client.connect()

const handler: Handler = async (event, context) => {
  try {
    const database = (await clientPromise).db(process.env.MONGODB_DATABASE)
    // @ts-ignore
    const collection = database.collection(process.env.MONGODB_COLLECTION)

    const playerInitials = event.queryStringParameters?.playerInitials
    const score = event.queryStringParameters?.score
    const character = event.queryStringParameters?.character

    if (!playerInitials || !score || !character) {
      return { statusCode: httpStatus.BAD_REQUEST, body: 'invalid params' }
    }

    const results = await collection.find().sort('score', 'descending').toArray()
    if (results.length < 10) {
      await collection.insertOne({ playerInitials, score: parseInt(score, 10), character })
    } else {
      if (parseInt(score, 10) > parseInt(results[9].score, 10)) {
        await collection.insertOne({ playerInitials, score: parseInt(score, 10), character })
      }
    }

    return {
      statusCode: httpStatus.OK,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE'
      },
    }
  } catch (error) {
    if (error instanceof MongoServerError) {
      return { statusCode: httpStatus.INTERNAL_SERVER_ERROR, body: error }
    }
    return { statusCode: httpStatus.INTERNAL_SERVER_ERROR, body: (error as any).message }
  }
}

export { handler }
