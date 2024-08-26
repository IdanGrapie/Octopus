const request = require('supertest');
const app = require('../app');  // Assuming your main app is exported from app.js

describe('GET /', () => {
  it('should return the number of apples', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.text).toContain('We have 5 apples');  // You can customize this to match your app's output
  });
});
