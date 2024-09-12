const express = require('express');
const MongoClient = require('mongodb').MongoClient;

const app = express();
const port = 3000;

// MongoDB connection URL (using environment variable)
const url = process.env.MONGODB_URL || 'mongodb://localhost:27017'; 

// Database and collection names
const dbName = 'fruitsdb';
const collectionName = 'fruits';

app.get('/', async (req, res) => {
  const client = new MongoClient(url, { useUnifiedTopology: true });
  try {
    await client.connect();
    const db = client.db(dbName);
    const collection = db.collection(collectionName);
    const apple = await collection.findOne({ name: 'apples' });
    res.send(`Hello World! We have ${apple.qty} apples.`);
  } catch (err) {
    res.status(500).send('Error fetching data');
  } finally {
    await client.close();
  }
});

// Only start the server if the file is executed directly
if (require.main === module) {
  app.listen(port, '0.0.0.0', () => {
    console.log(`App running on http://0.0.0.0:${port}`);
  });
}

// Export the app for testing purposes
module.exports = app;
