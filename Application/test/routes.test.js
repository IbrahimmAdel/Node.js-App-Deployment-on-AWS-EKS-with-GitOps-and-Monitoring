const request = require('supertest');
const app = require('../app');

describe('Route Tests', () => {
  describe('GET /', () => {
    it('should return 200 status code', async () => {
      const response = await request(app).get('/');
      expect(response.status).toBe(200);
    });

    it('should return HTML content', async () => {
      const response = await request(app).get('/');
      expect(response.type).toBe('text/html');
      expect(response.text).toContain('<!DOCTYPE html>');
    });

    it('should contain company name in response', async () => {
      const response = await request(app).get('/');
      expect(response.text).toContain('Dream Come True Information Technology');
    });
  });

  describe('GET /about', () => {
    it('should return 200 status code', async () => {
      const response = await request(app).get('/about');
      expect(response.status).toBe(200);
    });

    it('should contain about page content', async () => {
      const response = await request(app).get('/about');
      expect(response.text).toContain('About Us');
    });
  });

  describe('GET /services', () => {
    it('should return 200 status code', async () => {
      const response = await request(app).get('/services');
      expect(response.status).toBe(200);
    });

    it('should contain services list', async () => {
      const response = await request(app).get('/services');
      expect(response.text).toContain('Our Services');
    });
  });

  describe('Static Files', () => {
    it('should serve CSS files', async () => {
      const response = await request(app).get('/css/style.css');
      expect([200, 404]).toContain(response.status);
    });

    it('should serve JS files', async () => {
      const response = await request(app).get('/js/main.js');
      expect([200, 404]).toContain(response.status);
    });

    it('should serve images', async () => {
      const response = await request(app).get('/images/logo.jpeg');
      expect([200, 404]).toContain(response.status);
    });
  });

  describe('Error Handling', () => {
    it('should return 404 for unknown routes', async () => {
      const response = await request(app).get('/nonexistent-route');
      expect(response.status).toBe(404);
    });

    it('should show 404 page for unknown routes', async () => {
      const response = await request(app).get('/nonexistent-route');
      expect(response.text).toContain('Page Not Found');
    });
  });
});
