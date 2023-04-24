# LoadUp's Cat and Dog Sitting Service

This app was created as part of a coding challenge for LoadUp. The app allows users to schedule cat or dog sitting for a specific date and time. It has and 'Admin page' which lists all scheduled appointments.

- Ruby 3.2.2

- Rails 7.0.4

- Database: Postgres

- Testing: Minitest

---

LoadUp is rolling out a new service, cat and dog sitting. The product requirements are as follows:

1. A form to collect bookings that takes:

  a. First Name

  b. Last Name

  c. Animal Name

  d. Animal Type (Dog/Cat)

  e. Hours Requested (min 2, max 8)

  f. Date of service

2. A "pricing engine" to determine the cost of service

  a. Base charge of $20

  b. $10 additional per hour for dogs

  c. $5 additional per hour for cats

3. Display of all bookings on a separate page ("admin" pages)

4. Unit tests for the pricing engine

5. E2E (feature) tests for the booking form and admin pages
