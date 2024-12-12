## Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

**Description:**

This application demonstrates how to use different persistence technologies on Cloud Foundry with Spring. It stores the same domain objects (albums) in one of the following databases:

* **Relational Database:** MySQL, PostgreSQL, SQL Server (requires configuring database access and driver)
* **Document Database:** MongoDB
* **Key-Value Store:** Redis

The application is designed to test and experiment with various service bindings on Cloud Foundry. It is not intended to represent a realistic use case for each technology, as you would typically choose the most suitable database for your specific data type.

**Key Features:**

* **Service Binding:** Demonstrates service binding to different database services on Cloud Foundry.
* **Spring Profiles:** Uses Spring profiles to configure the application and database connections based on the bound service.
* **Java CFEnv:** Leverages the Java CFEnv library to inspect the environment when running on Cloud Foundry.
* **Domain Object:** Uses a simple `Album` domain object to store album information.
* **REST API:** Provides REST endpoints for managing albums.
* **Web UI:** Includes a basic web UI for interacting with the album data.

**Installation:**

1. **Prerequisites:**
   * Java 17+
   * Git
   * Maven or Gradle (build tool of choice)
   * Cloud Foundry CLI

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

3. **Build the Application:**
   ```bash
   ./gradlew build 
   ```

4. **Push to Cloud Foundry:**
   * Configure your Cloud Foundry target using the `cf api` command.
   * Log in using the `cf login` command.
   * Push the application to Cloud Foundry:
     ```bash
     cf push 
     ```
   * Bind the appropriate service to the application (e.g., `cf bind-service spring-music my-mysql-service`)

**Usage:**

* Access the application's web UI through the URL provided by Cloud Foundry.
* Use the UI to add, edit, and delete albums.

**Configuration:**

* The application uses Spring profiles to dynamically configure database connections based on the service bound to the application.
* You can change the active Spring profile using the `SPRING_PROFILES_ACTIVE` environment variable.
* The `manifest.yml` file specifies the default active profile (`http2`).

**Contributing:**

Contributions are welcome!

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and ensure they adhere to the coding standards.
4. Submit a pull request for review.

**License:**

This application is licensed under the Apache 2.0 License. See the `LICENSE` file for details.

**Contact:**

For any questions or feedback, please open an issue on the GitHub repository.

