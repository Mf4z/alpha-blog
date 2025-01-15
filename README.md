# Alpha Blog SIX

Alpha Blog Six is a blogging platform built using Ruby on Rails as part of the [Complete Ruby on Rails Developer Course](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/). This application provides a platform for users to create, edit, and manage blog posts and categories. It also demonstrates foundational skills in Rails, including MVC architecture, validations, testing, and deployment.

## Features

- User authentication and session management.
- Create, read, update, and delete (CRUD) functionality for blog posts.
- Manage blog categories, including creating and assigning categories to posts.
- Integration tests to ensure functionality.
- Responsive design for better user experience on various devices.
- Deployed on [Heroku](https://www.heroku.com/).

## Tech Stack

- **Backend:** Ruby on Rails 6
- **Frontend:** HTML5, CSS3, Bootstrap
- **Database:** PostgreSQL (production), SQLite3 (development and testing)
- **Testing:** RSpec, Capybara
- **Deployment:** Heroku

## Installation

Follow these steps to set up the application locally:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Mf4z/alpha-blog.git
   cd alpha-blog
   ```

2. **Install dependencies:**

   Ensure you have Ruby and Bundler installed. Then, run:

   ```bash
   bundle install
   ```

3. **Set up the database:**

   ```bash
   rails db:create db:migrate db:seed
   ```

4. **Start the Rails server:**

   ```bash
   rails server
   ```

5. **Access the application:**

   Open your browser and navigate to `http://localhost:3000`.

## Testing

To run the test suite, execute:

```bash
bundle exec rspec
```

Integration tests have been written to validate the functionality of categories and user workflows.

## Deployment

This application is deployed on Heroku. You can access it [here](https://your-app-name.herokuapp.com). To deploy your own version:

1. Ensure you have the Heroku CLI installed and logged in.
2. Create a Heroku app:

   ```bash
   heroku create
   ```

3. Push the code to Heroku:

   ```bash
   git push heroku main
   ```

4. Run migrations on Heroku:

   ```bash
   heroku run rails db:migrate
   ```

## Contributing

Contributions are welcome! If you have suggestions or improvements, please:

1. Fork the repository.
2. Create a new branch for your feature or fix:

   ```bash
   git checkout -b feature-name
   ```

3. Commit your changes:

   ```bash
   git commit -m "Description of changes"
   ```

4. Push to your branch:

   ```bash
   git push origin feature-name
   ```

5. Submit a pull request.

## License

This project is open-source and available under the [MIT License](LICENSE).

## Acknowledgments

- [The Complete Ruby on Rails Developer Course](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/) for providing the foundational guidance.
- [Rails Guides](https://guides.rubyonrails.org/) for detailed documentation.
- [Bootstrap](https://getbootstrap.com/) for the responsive design framework.

## Contact

For questions or suggestions, please reach out:

**Marwan Mai**  
[GitHub Profile](https://github.com/Mf4z)  
[Email](mailto:emef4z@gmail.com)
