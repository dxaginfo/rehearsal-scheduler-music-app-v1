CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  role VARCHAR(20),
  password_hash VARCHAR(255),
  phone VARCHAR(20)
);

CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  organizer_id INTEGER REFERENCES users(id),
  time TIMESTAMP,
  location VARCHAR(255),
  notes TEXT
);

CREATE TABLE rehearsal_participants (
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(20),
  PRIMARY KEY (rehearsal_id, user_id)
);

CREATE TABLE equipments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  is_available BOOLEAN,
  maintenance_notes TEXT
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  equipment_id INTEGER REFERENCES equipments(id),
  assigned_to INTEGER REFERENCES users(id)
);

CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  type VARCHAR(10),
  channel VARCHAR(20),
  status VARCHAR(20),
  created_at TIMESTAMP
);
