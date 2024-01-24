const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 3000;

// Set up EJS as the view engine
app.set('view engine', 'ejs');

// Use the body-parser middleware to parse form data
app.use(bodyParser.urlencoded({ extended: true }));

// Connect to MongoDB with the database name "Freedom"
mongoose.connect('mongodb+srv://freedomapp2023:DAxwE98UNLQOBf73@cluster0.univiw4.mongodb.net/Freedom', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Define the NGO schema and model
const NGO = mongoose.model('ngo', {
  name: String,
  contact: Number,
});

// Define the routes

// Read all NGOs
app.get('/', async (req, res) => {
  try {
    const ngos = await NGO.find({});
    res.render('index', { ngos });
  } catch (err) {
    console.error(err);
    res.status(500).send('An error occurred while fetching NGOs.');
  }
});

// Create a new NGO
app.post('/create', async (req, res) => {
  const { name, contact } = req.body;
  try {
    const ngo = new NGO({ name, contact });
    await ngo.save();
    res.redirect('/');
  } catch (err) {
    console.error(err);
    res.status(500).send('An error occurred while saving the NGO.');
  }
});

// Update an NGO
app.post('/update/:id', async (req, res) => {
  const ngoId = req.params.id;
  const { name, contact } = req.body;
  try {
    await NGO.findByIdAndUpdate(ngoId, { name, contact });
    res.redirect('/');
  } catch (err) {
    console.error(err);
    res.status(500).send('An error occurred while updating the NGO.');
  }
});

// Delete an NGO
app.post('/delete/:id', async (req, res) => {
    const ngoId = req.params.id;
    try {
      await NGO.findByIdAndDelete(ngoId);
      res.redirect('/');
    } catch (err) {
      console.error(err);
      res.status(500).send('An error occurred while deleting the NGO.');
    }
  });

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
