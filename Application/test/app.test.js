const request = require('supertest');
const app = require('../app');

describe('Dream Come True Website - App Tests', () => {
  it('should export an Express app', () => {
    expect(app).toBeDefined();
    expect(typeof app.listen).toBe('function');
    expect(typeof app.get).toBe('function');
    expect(typeof app.use).toBe('function');
  });

  it('should handle requests without starting server', async () => {
    // Test that the app can handle requests without manually starting it
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
  });
});
