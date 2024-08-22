const express = require('express');
const MongoClient = require('mongodb').MongoClient;

const app = express();
const port = 3000;

// MongoDB connection URL (use the name of the MongoDB service in Docker Compose)
const url = 'mongodb://mongodb:27017';

// Database and collection names
const dbName = 'fruitsdb';
const collectionName = 'fruits';

// Endpoint to fetch the number of apples
app.get('/', async (req, res) => {
  const client = new MongoClient(url, { useUnifiedTopology: true });

  try {
    // Connect to MongoDB
    await client.connect();
    const db = client.db(dbName);
    const collection = db.collection(collectionName);

    // Find the apple document
    const apple = await collection.findOne({ name: 'apples' });

    // Send the number of apples as the response
    res.send(`Hello World! We have ${apple.qty} apples.`);
  } catch (err) {
    res.status(500).send('Error fetching data');
  } finally {
    // Close the connection
    await client.close();
  }
});

// Start the server
app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});
