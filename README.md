# Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application uses Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Running the Application

### Pre-requisites

- Java 17+
- [Cloud Foundry CLI](https://github.com/cloudfoundry/cli)

### Local Development

1. **Build the Application:**  
   ```bash
   ./gradlew build
   ```
2. **Run the Application:**
   ```bash
   ./gradlew bootRun -Dspring.profiles.active=mysql 
   ``` 
   Replace `mysql` with `postgres`, `mongodb`, or `redis` based on your chosen persistence technology.
3. **Access the Application:** Navigate to `http://localhost:8080` in your browser.

### Cloud Foundry Deployment

1. **Log in to Cloud Foundry:** 
   ```bash
   cf login -a <api-endpoint> -u <username> -p <password>
   ```
2. **Push the Application:** 
   ```bash
   cf push
   ```
3. **Access the Application:** Open the assigned URL provided by Cloud Foundry.

##  Configuration

The application's configuration is handled through `application.yml` and profiles. The following profiles are available:

- **mysql:**  Uses MySQL for persistence.
- **postgres:** Uses PostgreSQL for persistence.
- **mongodb:** Uses MongoDB for persistence.
- **redis:** Uses Redis for persistence.
- **http2:** Enables HTTP/2 support.

You can activate profiles either locally or on Cloud Foundry:

- **Local:** Pass the profile name with the `-Dspring.profiles.active` flag: `./gradlew bootRun -Dspring.profiles.active=mysql`
- **Cloud Foundry:** Set the `SPRING_PROFILES_ACTIVE` environment variable.

## Cloud Foundry Service Bindings

This application leverages Cloud Foundry service bindings for database connectivity. When pushing the application, ensure the appropriate service instances are bound:

- **MySQL:**  Bind a MySQL service instance.
- **PostgreSQL:** Bind a PostgreSQL service instance.
- **MongoDB:** Bind a MongoDB service instance.
- **Redis:** Bind a Redis service instance.

## Contributing

Contributions are welcome! Please follow the standard Git workflow:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes and add tests.
4. Submit a pull request with a clear description of your changes.

## License

This project is licensed under the Apache 2.0 License. See the `LICENSE` file for details. 

## Contact

For any questions, issues, or feedback, please feel free to open an issue on the GitHub repository.

