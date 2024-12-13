## Spring Music - Sample Cloud Foundry Application

This repository contains a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

**The application allows you to store the same domain objects in one of a variety of different persistence technologies:**

- **Relational:** H2, MySQL, PostgreSQL, SQL Server, Oracle (requires adding driver to `libs` directory).
- **Document:** MongoDB
- **Key-value store:** Redis

**This is not a realistic use case for these technologies.** In a real application, you would typically choose the persistence technology that best suits the type of data you need to store. However, this application is useful for testing and experimenting with different types of services on Cloud Foundry.

**Features:**

- **Multiple persistence options:** Explore different database technologies within one application.
- **Spring Boot Profiles:** Switch between persistence technologies using Spring Boot profiles.
- **Cloud Foundry Service Binding:** Utilizes Cloud Foundry service binding for easy database configuration.
- **Java CFEnv:** Leverages the `java-cfenv` library for environment detection on Cloud Foundry.
- **REST API:** Provides REST endpoints for interacting with data stored in the selected database.
- **Web UI:** Includes a basic web interface built with AngularJS for managing data.

**Getting Started:**

1. **Install Java 17:** Ensure you have Java 17 installed on your machine.

2. **Install Gradle:** Download and install Gradle from [https://gradle.org/](https://gradle.org/).

3. **Set up Cloud Foundry:** Follow the instructions at [https://docs.cloudfoundry.org/](https://docs.cloudfoundry.org/) to install and configure Cloud Foundry.

4. **Clone the repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

5. **Build the application:**
   ```bash
   ./gradlew build
   ```

6. **Deploy to Cloud Foundry:**
   ```bash
   cf push
   ```
   **Note:** Before deploying, ensure you have created Cloud Foundry services for the database technologies you want to use. You can find instructions on creating these services in the Cloud Foundry documentation.

**Running the application locally:**

1. **Set up your local database:** Configure your local database (H2, MySQL, PostgreSQL, MongoDB, or Redis) based on the profile you want to use.

2. **Set the appropriate Spring Boot profile:** Edit the `application.yml` file to activate the desired profile (e.g., `mysql`, `mongodb`, `redis`).

3. **Run the application:**
   ```bash
   ./gradlew bootRun
   ```

**Accessing the web UI:**
Once the application is running, you can access the web UI at `http://localhost:8080`.

**Using the REST API:**
The application provides the following REST endpoints:

- **`/albums`:**
    - `GET`: Retrieve all albums.
    - `PUT`: Create a new album.
    - `POST`: Update an existing album.
- **`/albums/{id}`:**
    - `GET`: Retrieve an album by its ID.
    - `DELETE`: Delete an album by its ID.

**Contributing:**

Contributions to this project are welcome! Feel free to submit issues or pull requests.

**License:**

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

**Contact:**

For any questions or suggestions, please open an issue on the [GitHub repository](https://github.com/gitrey/spring-music).

