## Spring Music - A Cloud Foundry Sample Application

**[![Build Status](https://travis-ci.org/cloudfoundry-samples/spring-music.svg?branch=main)](https://travis-ci.org/cloudfoundry-samples/spring-music)**

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application uses Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

### Running the Application Locally

To run the application locally:

1. **Install Java 17+:** You can download the JDK from the [Oracle website](https://www.oracle.com/java/technologies/downloads/) or use your preferred package manager.
2. **Install Gradle:** Download and install Gradle from the [Gradle website](https://gradle.org/releases/). Ensure the Gradle installation directory is in your `PATH` environment variable.
3. **Build the Application:** Run `gradle build` from the root directory of the project.
4. **Start the Application:** Run `gradle bootRun` from the root directory of the project.

You can then access the application at http://localhost:8080/

### Deploying to Cloud Foundry

To deploy the application to Cloud Foundry:

1. **Log in to your Cloud Foundry instance:**  Use `cf login` with your Cloud Foundry credentials.
2. **Push the application:** Run `cf push spring-music` from the root directory of the project. 
3. **Bind Services:** Bind the desired services to the application:
    * **For MySQL:** `cf bind-service <your-mysql-service-name> spring-music`
    * **For PostgreSQL:** `cf bind-service <your-postgres-service-name> spring-music`
    * **For MongoDB:** `cf bind-service <your-mongodb-service-name> spring-music`
    * **For Redis:** `cf bind-service <your-redis-service-name> spring-music`
4. **Start the Application:** Run `cf restart spring-music` to restart the application with the newly bound services.

### Features

* **Spring Boot:** This application is built using Spring Boot for quick and easy setup and deployment.
* **Multiple Persistence Technologies:** It supports MySQL, PostgreSQL, MongoDB, and Redis.
* **Java CFEnv:** The application uses the Java CFEnv library to inspect the environment and access bound services.
* **Bean Profiles:** The application utilizes Spring profiles to configure the appropriate persistence technology based on the bound service.
* **REST API:** The application exposes a REST API for managing albums.
* **Web UI:** It includes a basic web user interface built using AngularJS for viewing and interacting with the albums.
* **Error Handling:**  The application includes endpoints for testing error handling scenarios on Cloud Foundry.

### Exploring the Code

* The `src/main/java/org/cloudfoundry/samples/music/config/SpringApplicationContextInitializer.java` class handles the initialization of the Spring application context. It activates the appropriate profile based on the bound services and excludes unnecessary auto-configurations.
* The `src/main/java/org/cloudfoundry/samples/music/config/data` package contains configuration classes for the different persistence technologies. Each class is annotated with `@Profile` to indicate which profile it should be activated under.
* The `src/main/java/org/cloudfoundry/samples/music/domain` package contains the `Album` domain object used for storing album data.
* The `src/main/java/org/cloudfoundry/samples/music/repositories` package contains the repository interfaces for accessing album data. It includes separate repository implementations for each persistence technology.
* The `src/main/java/org/cloudfoundry/samples/music/web` package contains the controllers responsible for exposing the REST API and managing the web user interface.

### Contributing

Contributions are welcome! If you would like to contribute to the project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes and commit them with clear and concise commit messages.
4. Push your changes to your fork.
5. Submit a pull request to the original repository.

### License

Spring Music is licensed under the Apache 2.0 License.

### Contact

If you have any questions or issues, feel free to open an issue on the GitHub repository.

