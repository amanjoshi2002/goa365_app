const mongoose = require('mongoose');

const noteSchema = new mongoose.Schema({
  name: String,
  contact: Int,
});

module.exports = mongoose.model('ngo', noteSchema);
