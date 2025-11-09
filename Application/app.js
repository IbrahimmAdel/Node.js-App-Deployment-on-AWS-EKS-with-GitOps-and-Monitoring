const express = require('express');
const path = require('path');
const helmet = require('helmet');
const compression = require('compression');
const app = express();

// Use different port for tests to avoid conflicts
const PORT = process.env.NODE_ENV === 'test' ? 0 : (process.env.PORT || 3000);

// Security middleware
app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      styleSrc: ["'self'", "'unsafe-inline'", "https://fonts.googleapis.com"],
      fontSrc: ["'self'", "https://fonts.gstatic.com"],
      scriptSrc: ["'self'"],
      imgSrc: ["'self'", "data:", "https:"]
    }
  }
}));

// Compression middleware
app.use(compression());

// Set view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Static files
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/', require('./routes/index'));

// Error handling
app.use((req, res) => {
  res.status(404).render('404', { title: 'Page Not Found' });
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).render('500', { title: 'Server Error' });
});

// Only start server if this file is run directly (not when required by tests)
if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Dream Come True IT website running on port ${PORT}`);
    console.log(`Visit: http://localhost:${PORT}`);
  });
}

module.exports = app;
