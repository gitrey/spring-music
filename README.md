## Spring Music: A Cloud Foundry Sample Application

This repository provides a Spring Boot application demonstrating how to use different database services on Cloud Foundry. It showcases the flexibility of Spring Framework and Spring Boot, allowing you to seamlessly connect your application to various persistence technologies like relational databases, document databases, and key-value stores.

**Note:** This application does not represent a realistic use case for choosing a specific persistence technology. It's designed for testing and experimentation, allowing you to compare and contrast different database services on Cloud Foundry.

### Features

*   **Multiple Persistence Technologies:**  The application is configured to work with:
    *   **Relational Databases:** MySQL, PostgreSQL, SQL Server, and H2 (for testing purposes).
    *   **Document Databases:** MongoDB.
    *   **Key-Value Stores:** Redis.
*   **Spring Profiles:**  Spring profiles are used to enable the appropriate database configuration based on the service bound to the application.
*   **Java CFEnv:** The application utilizes the Java CFEnv library to inspect the environment and automatically detect bound services on Cloud Foundry.
*   **Cloud Foundry Service Bindings:**  The application leverages Cloud Foundry service bindings for seamless integration with various database services.
*   **Web UI:**  A simple web UI allows you to interact with the application, create, edit, and delete album records.
*   **Error Handling:**  The application includes error handling endpoints for demonstrating how to force errors and trigger application crash scenarios.
*   **Application Info:** The application provides endpoints to display details about its active profiles and bound services.

### Getting Started

1.  **Prerequisites:**
    *   [Cloud Foundry CLI](https://cli.cloudfoundry.org/)
    *   [Java Development Kit (JDK 17+)](https://www.oracle.com/java/technologies/javase-downloads.html)
    *   [Gradle](https://gradle.org/)
2.  **Clone the Repository:**
    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```
3.  **Build the Application:**
    ```bash
    ./gradlew build
    ```
4.  **Create and Push the Application:**
    ```bash
    cf push
    ```
5.  **Bind Services:**
    *   To bind a MySQL service: `cf bind-service <service-name> spring-music`
    *   To bind a PostgreSQL service: `cf bind-service <service-name> spring-music`
    *   To bind a MongoDB service: `cf bind-service <service-name> spring-music`
    *   To bind a Redis service: `cf bind-service <service-name> spring-music`
6.  **Access the Application:**  Open the application's URL in your browser (e.g., `http://<app-name>.cfapps.io`).

### Configuration

You can customize the application behavior by modifying the `application.yml` file.

*   **Active Profiles:**  Set the `SPRING_PROFILES_ACTIVE` environment variable to choose the desired database configuration.
*   **Database Credentials:**  Update the `spring.datasource` and `spring.data.mongodb` sections with your database credentials if necessary.
*   **Logging Level:** Adjust the `logging.level` configuration for different log levels.

### Running the Application Locally

You can run the application locally for development purposes:

```bash
./gradlew bootRun
```

**Note:** You'll need to configure database connections locally for testing purposes.

### Contributing

We welcome contributions to improve the Spring Music sample application! Please follow our contribution guidelines:

1.  **Fork the repository.**
2.  **Create a new branch for your feature or bug fix.**
3.  **Make your changes and commit them with clear, concise messages.**
4.  **Push your changes to your fork.**
5.  **Submit a pull request to the main repository.**

### License

This project is licensed under the Apache 2.0 License.

### Contact

For any questions or suggestions, feel free to open an issue on our GitHub repository or contact us directly.

