## Spring Music: A Cloud Foundry Sample Application

This repository contains a sample application demonstrating how to use database services on Cloud Foundry with the Spring Framework and Spring Boot. 

## Description

This application is designed to store the same domain objects in a variety of persistence technologies, including relational, document, and key-value stores. While not a realistic use case for these technologies, it's valuable for testing and experimenting with different service types on Cloud Foundry.

**Technologies Used:**

* Spring Framework
* Spring Boot
* Java CFEnv
* Various persistence technologies (MySQL, PostgreSQL, MongoDB, Redis)

## Installation

1. **Prerequisites:**
   - Java 17
   - Git
   - [Cloud Foundry CLI](https://docs.cloudfoundry.org/devguide/installcli.html)
   - [Gradle](https://gradle.org/install/)

2. **Clone the repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

3. **Build the application:**
   ```bash
   ./gradlew build
   ```

4. **Push to Cloud Foundry:**
   ```bash
   cf push
   ```

**Note:** You'll need to have the necessary Cloud Foundry services (MySQL, PostgreSQL, MongoDB, or Redis) provisioned and bound to the application. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for more details.

## Running the Application

Once deployed, you can access the application at the URL provided by `cf push`. 

**Endpoints:**

* `/albums`: Lists all albums.
* `/albums/{id}`: Retrieves an album by ID.
* `/albums`: Adds a new album (PUT request).
* `/albums`: Updates an existing album (POST request).
* `/albums/{id}`: Deletes an album by ID (DELETE request).
* `/errors/kill`: Forces the application to exit.
* `/errors/fill-heap`: Fills the heap with junk, triggering a crash.
* `/errors/throw`: Throws a NullPointerException.
* `/appinfo`: Provides information about the application, including active profiles and bound services.
* `/service`: Shows details about the bound services.

## Configuration

The application uses Spring profiles and Java CFEnv to dynamically configure itself based on the bound services.

* **Spring Profiles:** `mysql`, `postgres`, `mongodb`, `redis`
* **Environment Variables:**
    * `SPRING_PROFILES_ACTIVE`: Specifies the active profile.
    * `JBP_CONFIG_OPEN_JDK_JRE`: Configures the Java version (set to 17+).
    * `JBP_CONFIG_SPRING_AUTO_RECONFIGURATION`: Disables automatic reconfiguration (set to `'enabled: false'`).

**To change the service type:**

1. Unbind the current service from the application using `cf unbind-service <app-name> <service-name>`.
2. Bind a new service using `cf bind-service <app-name> <service-name>`.
3. Restart the application using `cf restart <app-name>`.

## Contributing

Contributions are welcome! Please follow the standard GitHub workflow:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes with clear and concise messages.
4. Push your changes to your fork.
5. Open a pull request against the `main` branch.

## License

This project is licensed under the Apache 2.0 License.

## Contact

For any questions or issues, please open an issue on the GitHub repository.

