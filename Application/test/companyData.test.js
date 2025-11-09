const routes = require('../routes/index');

describe('Company Data Tests', () => {
  const companyData = routes.companyData;

  it('should have correct company name', () => {
    expect(companyData.name).toBe('Dream Come True Information Technology');
  });

  it('should have tagline', () => {
    expect(companyData.tagline).toContain('FinTech');
    expect(companyData.tagline).toContain('dream');
  });

  it('should have stats object', () => {
    expect(companyData.stats).toBeDefined();
    expect(companyData.stats.members).toContain('50,000');
    expect(companyData.stats.employees).toContain('51-200');
    expect(companyData.stats.founded).toBe('2020');
  });

  it('should have services array', () => {
    expect(Array.isArray(companyData.services)).toBe(true);
    expect(companyData.services.length).toBeGreaterThan(0);
    expect(companyData.services).toContain('Financial Technology Courses');
    expect(companyData.services).toContain('Blockchain Education');
  });

  it('should have contact information', () => {
    expect(companyData.contact).toBeDefined();
    expect(companyData.contact.website).toBe('https://dreamcometrue.ai');
    expect(companyData.contact.headquarters).toContain('Dubai');
  });

  it('should have specialties array', () => {
    expect(Array.isArray(companyData.specialties)).toBe(true);
    expect(companyData.specialties).toContain('fintech');
    expect(companyData.specialties).toContain('blockchain');
    expect(companyData.specialties).toContain('software');
  });
});
