## Spring Music: A Cloud Foundry Sample Application

This project demonstrates how to use database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

### Purpose

This sample application showcases the interaction between Spring Boot, different database technologies (relational, document, key-value stores), and Cloud Foundry's service binding capabilities. It aims to provide a practical example of how to design an application that can seamlessly adapt to different database backends.

### Key Features

- **Multiple Persistence Technologies:** Supports H2, MySQL, PostgreSQL, MongoDB, and Redis databases for storing the same domain objects (albums). This allows you to experiment with different database options and their strengths without altering the application's core logic.
- **Spring Boot Profiles:** Uses Spring Boot profiles for a flexible approach to configuration. It configures the necessary connection objects and database dependencies based on the active profile.
- **Cloud Foundry Service Binding:** Leverages Cloud Foundry's service binding feature to automatically configure the application with the provided services.
- **Java CFEnv Library:** Employs the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment variables and service instances when running on Cloud Foundry.
- **Web Interface:** Offers a basic web interface for managing and displaying album data.

### Running the Application

1. **Set up Cloud Foundry:** Ensure you have a Cloud Foundry environment set up and configured.
2. **Create Services:** Create instances of the desired services on Cloud Foundry (e.g., MongoDB, Redis, PostgreSQL).
3. **Push Application:** Push the application to Cloud Foundry:
    ```bash
    cf push spring-music
    ```
4. **Bind Services:** Bind the created services to the application:
    ```bash
    cf bind-service spring-music <service-name>
    ```
5. **Access the Application:** Access the application's web interface through the Cloud Foundry route.

### Configuration

The application uses Spring Boot profiles to configure the database connection and dependency management. You can specify the desired profile using the `SPRING_PROFILES_ACTIVE` environment variable when deploying the application to Cloud Foundry.

- **`http2`:** Enables HTTP/2 for the server.
- **`mysql`:** Configures the application for MySQL.
- **`postgres`:** Configures the application for PostgreSQL.

### Development

To develop and test the application locally, you can:

1. **Install Dependencies:** Ensure you have the necessary dependencies installed (e.g., Java, Maven, Spring Boot).
2. **Run with Embedded Database:** You can run the application using an embedded H2 database.
3. **Configure Local Services:** For testing with other databases, configure them locally and provide the connection details in the `application.yml` file.

### Further Exploration

- Examine the configuration files (`application.yml`) for detailed information about database connections and profiles.
- Explore the source code to understand how the application utilizes Spring Boot and database-specific libraries.
- Modify the application to add more features or support additional database technologies.

This sample application is a starting point for building more complex and sophisticated applications that leverage Cloud Foundry's service binding and Spring Boot's capabilities for data persistence.

