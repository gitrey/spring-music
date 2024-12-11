## Spring Music: A Cloud Foundry Sample App

This repository contains a sample application showcasing the use of database services on Cloud Foundry with Spring Framework and Spring Boot.

## Overview

Spring Music demonstrates how to integrate different database services (relational, document, key-value stores) into your Cloud Foundry application. The application uses the same domain object model for various persistence technologies, allowing you to easily switch between them and experiment with different service bindings.

**Features:**

- **Multiple Database Support:** Integrates with various databases including MySQL, PostgreSQL, MongoDB, and Redis.
- **Spring Profiles:** Uses Spring profiles to configure and activate different database configurations based on service bindings.
- **Cloud Foundry Environment:** Leverages Java CFEnv library to inspect the Cloud Foundry environment and configure service connections.
- **Spring Boot Auto-Configuration:** Takes advantage of Spring Boot's auto-configuration for streamlined setup.
- **RESTful API:** Exposes REST endpoints to manage album data.
- **AngularJS Frontend:** Provides a user-friendly interface for viewing and manipulating album data.

## Getting Started

1. **Prerequisites:**

   - [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/javase-downloads.html) (Java 17+ is recommended)
   - [Maven or Gradle](https://maven.apache.org/, https://gradle.org/) (Build tool of your choice)
   - [Cloud Foundry CLI](https://docs.cloudfoundry.org/devguide/cli/index.html) (For deploying to Cloud Foundry)

2. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/spring-music.git
   ```

3. **Build the Application:**

   - **Maven:** `mvn clean package`
   - **Gradle:** `./gradlew build`

4. **Deploy to Cloud Foundry:**

   - **Push the application:**
     ```bash
     cf push spring-music -p build/libs/spring-music-*.jar -f manifest.yml
     ```

   - **Bind a service:**
     ```bash
     cf bind-service spring-music <service-name>
     ```

     Replace `<service-name>` with the name of the service instance you want to bind (e.g., "mysql-service," "mongodb-service").

## Running the Application Locally

You can run the application locally for testing purposes:

1. **Set up a local database:**
   - Install and configure a database instance (MySQL, PostgreSQL, MongoDB, Redis).
2. **Update the `application.yml` file:**
   - Uncomment the configuration for the database you want to use locally.
   - Set the database connection details (URL, username, password) accordingly.
3. **Run the application:**
   - **Maven:** `mvn spring-boot:run`
   - **Gradle:** `./gradlew bootRun`

## Architecture

The application consists of the following components:

- **Domain Model:** The `Album` class represents the domain object, storing information about albums.
- **Repositories:**
   - `JpaAlbumRepository` (for relational databases)
   - `RedisAlbumRepository` (for Redis)
   - `MongoAlbumRepository` (for MongoDB)
- **Web Controllers:** `AlbumController`, `InfoController`, and `ErrorController` handle REST API requests and provide information about the application.
- **Frontend:** The AngularJS frontend interacts with the REST API, displaying and allowing manipulation of album data.

## Contributing

Contributions to the project are welcome! Feel free to submit issues, feature requests, and pull requests.

## License

This project is licensed under the Apache 2.0 License.

## Contact

For any questions or feedback, please open an issue on the GitHub repository.

