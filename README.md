## Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application use Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

### Running Locally

You can run the Spring Music application locally for testing and development.

1. **Set up the environment:** Ensure you have Java 17+ and a suitable database installed (MySQL, PostgreSQL, or Redis).
2. **Configure the database:** Update the `application.yml` file with the correct database connection details for your setup.
3. **Run the application:** Execute the command `./gradlew bootRun` from the project directory.

### Running on Cloud Foundry

To deploy the application to Cloud Foundry, follow these steps:

1. **Push to Cloud Foundry:** Execute the command `cf push spring-music` from the project directory.
2. **Bind Services:** Bind the desired service instance(s) to the application. For example, to bind a PostgreSQL service instance named `my-postgres` to the application: `cf bind-service spring-music my-postgres`.
3. **Restart the Application:** If needed, restart the application for the service bindings to take effect. `cf restart spring-music`.
4. **Access the Application:** Access the application via the provided route, for example: `https://spring-music.cfapps.io`.

### Using HTTP/2

The application supports HTTP/2 for improved performance and security. To enable it:

1. **Set HTTP/2 profile:** Set the `SPRING_PROFILES_ACTIVE` environment variable to `http2`.
2. **Push to Cloud Foundry:** `cf push spring-music`.

### Code Structure

* **`Application.java`:** The main application class, starting the Spring Boot application.
* **`SpringApplicationContextInitializer.java`:**  Initializes the application context based on service bindings.
* **`AlbumRepositoryPopulator.java`:** Populates the database with sample data on startup.
* **`Album.java`:** Represents an album entity.
* **`RandomIdGenerator.java`:**  Custom generator for unique album IDs.
* **`config.data`:**  Configuration for different persistence layers:
    * **`RedisConfig.java`:** Redis repository configuration.
    * **`JpaConfig.java`:** JPA repository configuration.
* **`repositories`:**  Repository classes for different persistence technologies:
    * **`JpaAlbumRepository.java`:** JPA repository.
    * **`MongoAlbumRepository.java`:** MongoDB repository.
    * **`RedisAlbumRepository.java`:** Redis repository.
* **`web`:**  Controller classes for web endpoints:
    * **`AlbumController.java`:** Handles album CRUD operations.
    * **`ErrorController.java`:** Provides endpoints for testing error handling.
    * **`InfoController.java`:**  Provides information about the running application.
* **`static`:**  Static resources for the web UI:
    * **`index.html`:** The main web application page.
    * **`js`:**  JavaScript files for UI logic.
    * **`css`:** CSS stylesheets for UI styling.
    * **`templates`:** HTML templates for UI components.

### Contributing

Contributions to the Spring Music sample application are welcome! Please follow these guidelines:

* **Fork the repository:** Create a fork of the repository on GitHub.
* **Create a branch:** Create a new branch for your feature or bug fix.
* **Write your code:** Make your changes and ensure thorough testing.
* **Submit a pull request:** Submit a pull request to the main repository.

### License

Spring Music is released under the Apache 2.0 License.

### Contact

For any questions or feedback, please feel free to:

* Open an issue on the GitHub repository.
* Contact the Pivotal Cloud Foundry team.

