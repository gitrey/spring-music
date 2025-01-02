## Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application uses Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.


## Running the Application

### Running Locally

1. **Install JDK 17 or higher:** Ensure you have a suitable Java Development Kit installed.
2. **Install Gradle:** Download and install the Gradle build tool.
3. **Build the application:** Run `./gradlew build` from the project root directory.
4. **Run the application:** Run `./gradlew bootRun` from the project root directory.
5. **Access the application:** Open your web browser and navigate to `http://localhost:8080`.

### Running on Cloud Foundry

1. **Push the application to Cloud Foundry:**  Run `cf push spring-music` from the project root directory.
2. **Bind services to the application:**  Use the `cf bind-service` command to bind the required services (e.g., MySQL, MongoDB, or Redis) to the application. For more information on binding services, refer to the Cloud Foundry documentation. 
3. **Access the application:** Open your web browser and navigate to the application URL provided by Cloud Foundry. 

**Note:** The application is configured to use the `http2` profile by default. You can change the active profile by modifying the `SPRING_PROFILES_ACTIVE` environment variable in the `manifest.yml` file.


## Example Deployment

For example, to deploy the application to Cloud Foundry with a bound MySQL service, perform the following steps:

1. Create a MySQL service: `cf create-service p-mysql my-mysql-service`
2. Bind the service to the application: `cf bind-service spring-music my-mysql-service`
3. Push the application: `cf push spring-music`

The application will automatically configure itself to use the bound MySQL service.


## Project Structure

* **src/main/java**: Contains the Java source code for the application.
    * **org.cloudfoundry.samples.music.domain**: Contains the domain model for the application.
    * **org.cloudfoundry.samples.music.config**: Contains configuration classes for the application.
    * **org.cloudfoundry.samples.music.repositories**: Contains the repositories for accessing the database.
    * **org.cloudfoundry.samples.music.web**: Contains the controllers for handling web requests.

* **src/main/resources**: Contains configuration files and static resources.
    * **albums.json**: Contains initial data for the application.
    * **application.yml**: Contains the application configuration.
    * **static**: Contains static web resources such as CSS, JavaScript, and images.
    * **templates**: Contains templates for the application's UI.

* **gradle**: Contains the Gradle build files for the application.

* **build.gradle**: Specifies the dependencies and build configurations for the application.

* **manifest.yml**:  Defines the deployment configuration for the application on Cloud Foundry.


## Contributing

We welcome contributions to Spring Music! 

* **Fork the repository:** [Link to GitHub Repository]
* **Create a new branch:** Create a branch for your feature or bug fix.
* **Write clean and well-documented code:** Follow our coding style guide.
* **Submit a Pull Request:** Submit your changes for review.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more information.


## Contact

For any questions or feedback, please feel free to:

* Email us at: support@cymbal.coffee
* Open an issue on our GitHub repository: [Link to GitHub Repository]

We look forward to hearing from you!

