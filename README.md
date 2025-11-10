# 🎓 UniCatalog — University Management System

A Ruby on Rails 7 application for managing universities, departments, programs, and instructors.
It demonstrates key Rails features such as ActiveRecord associations, model validations, pagination, search/filter, and data visualization using Mapbox.

## 📚 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [Setup Instructions](#-setup-instructions)
- [Database and Seed Data](#-database-and-seed-data)
- [Project Structure](#-project-structure)
- [ActiveRecord Models and Relationships](#-activerecord-models-and-relationships)
- [Key Features Demonstrated](#-key-features-demonstrated)
- [Validation and ERD](#-validation-and-erd)
- [Acknowledgements](#-acknowledgements)

## 🧩 Overview

UniCatalog is a web application that allows users to explore and manage academic data for multiple universities.
It was built as part of an Intro to Rails project to demonstrate model relationships, data navigation, and web interface integration with Rails conventions.

## 🌟 Features

- **University Management**: Create, list, and view universities
- **Department Organization**: Each university manages multiple departments
- **Program Management**: Programs are linked to universities and instructors
- **Instructor Association**: Many-to-many relationship between instructors and programs
- **Search & Filtering**: Simple text search and hierarchical filtering
- **Pagination**: Data navigation using Kaminari
- **Map Visualization**: Mapbox integration showing university locations
- **ERD Diagram**: Auto-generated Entity Relationship Diagram
- **Bootstrap Styling**: Responsive, clean user interface
- **Faker Dataset**: Automatically seeded test data for 200+ records

## ⚙️ Technology Stack

| Layer | Technology |
|-------|------------|
| Framework | Ruby on Rails 7.1.6 |
| Language | Ruby 3.1.4 |
| Database | SQLite3 (development/test) |
| Styling | Bootstrap 5 |
| Pagination | Kaminari |
| Data Generation | Faker |
| Map Integration | Mapbox Static Map API |
| ERD Tool | rails-erd |
| Environment Variables | dotenv-rails |

## 🧰 Setup Instructions

### 1️⃣ Clone the repository
```bash
git clone https://github.com/yourusername/unicatalog.git
cd unicatalog
```

### 2️⃣ Install dependencies
```bash
bundle install
```

### 3️⃣ Set up the database
```bash
rails db:create db:migrate
```

### 4️⃣ Seed the database
```bash
rails db:seed
```

(This populates 20 universities, 60 departments, 200+ programs, and multiple instructors.)

### 5️⃣ Run the server
```bash
rails s
```

Visit `http://localhost:3000` in your browser.

## 🗂️ Database and Seed Data

**Faker-generated dataset:**

The dataset is created using the Faker gem, producing realistic names and data for:

- Universities (e.g., "University of Toronto")
- Programs (e.g., "Applied Science – Psychology")
- Departments (e.g., "Computer Science", "Business Studies")
- Instructors (random names + email addresses)

**📁 File: `db/seeds.rb`**
Populates over 200 total records across all tables and relationships.

## 🏗️ Project Structure

```
app/
├── models/
│   ├── university.rb
│   ├── department.rb
│   ├── program.rb
│   └── instructor.rb
├── controllers/
│   ├── universities_controller.rb
│   ├── programs_controller.rb
│   ├── departments_controller.rb
│   └── pages_controller.rb (for About page)
├── views/
│   ├── universities/
│   ├── programs/
│   ├── departments/
│   └── pages/about.html.erb
└── assets/
    ├── stylesheets/
    └── images/
```

## 🧠 ActiveRecord Models and Relationships

| Model | Relationships |
|-------|---------------|
| University | `has_many :programs`<br>`has_many :departments` |
| Department | `belongs_to :university` |
| Program | `belongs_to :university`<br>`has_and_belongs_to_many :instructors` |
| Instructor | `has_and_belongs_to_many :programs` |

This covers:

✅ Two or more one-to-many (University → Programs, University → Departments)

✅ One many-to-many (Programs ↔ Instructors)

## 🔍 Key Features Demonstrated

| Feature | Description |
|---------|-------------|
| Collection Navigation (3.1) | Index pages list all records with pagination |
| Member Pages (3.2) | Show pages for each model (University, Program, Department) |
| Multi-model Data (3.3) | University show page lists associated Programs & Departments |
| Hierarchical Navigation (3.4) | Linked navigation between University ↔ Programs |
| Pagination (3.5) | Implemented using Kaminari for all index pages |
| Mapping (3.6) | Mapbox Static Map API shows university locations |

## ✅ Validation and ERD

**Model Validations**

All models include basic validations such as:

```ruby
validates :name, presence: true, uniqueness: true
```

**ERD Diagram**

Generated using:

```bash
bundle exec erd
```

Output: `erd.png` (located in `/app/assets/images/`)

## 🗺️ Map Visualization (Feature 3.6)

Each university show page displays a map based on stored latitude/longitude values using Mapbox Static Maps API.
Configured with:

```
ENV['MAPBOX_ACCESS_TOKEN']
```

in `.env`.

## 🙌 Acknowledgements

- Built for **WEBD-3010 (Web Development 3)** at RRC Polytech
- Instructor guidance and project rubric by [Your Instructor's Name]
- Dataset generated with Faker gem
- Map visualization via Mapbox API


## 👨‍💻 Author

**Mark Kenneth Garcia**
Full Stack Web Development Student — RRC Polytech
🔗 GitHub: [MKG-RRC](https://github.com/MKG-RRC)

---

✅ **Last updated:** November 2025
