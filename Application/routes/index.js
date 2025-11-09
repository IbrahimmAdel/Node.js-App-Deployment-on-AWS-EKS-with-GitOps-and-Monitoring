const express = require('express');
const router = express.Router();

// Company data (dynamic content)
const companyData = {
  name: "Dream Come True Information Technology",
  tagline: "We can change the world for the better with one FinTech educational module at a time - one dream at a time.",
  description: "Dream Come True Information Technology began operations in September 2021 as an online financial technology course, affiliate marketing, and charitable act. We quickly multiplied from an online classroom to an offline team that gives back to the community.",
  stats: {
    members: "50,000+",
    employees: "51-200",
    founded: "2020"
  },
  services: [
    "Financial Technology Courses",
    "Blockchain Education",
    "Real Estate Investment",
    "Digital Marketing",
    "IT Infrastructure",
    "Software Development",
    "Content Writing"
  ],
  contact: {
    website: "https://dreamcometrue.ai",
    industry: "IT Services and IT Consulting",
    headquarters: "Trade Centre First, Dubai",
    type: "Privately Held"
  },
  specialties: [
    "software", "website", "blockchain", "full stack", "fintech",
    "education", "financial", "reward system", "it infrastructure", "content writing"
  ]
};

// Home page
router.get('/', (req, res) => {
  res.render('index', {
    title: 'Home',
    data: companyData
  });
});

// About page
router.get('/about', (req, res) => {
  res.render('about', {
    title: 'About Us',
    data: companyData
  });
});

// Services page
router.get('/services', (req, res) => {
  res.render('services', {
    title: 'Our Services',
    data: companyData
  });
});

// Export both router and companyData for testing
module.exports = router;
module.exports.companyData = companyData;
