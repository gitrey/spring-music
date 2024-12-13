## Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application uses Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Getting Started

1. **Prerequisites:**
   - Java 17
   - Gradle
   - Cloud Foundry CLI

2. **Clone the repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

3. **Build the application:**
   ```bash
   ./gradlew build
   ```

4. **Deploy to Cloud Foundry:**
   ```bash
   cf push
   ```

5. **Access the application:**
   - Open your web browser and navigate to the URL provided by Cloud Foundry.

## Configuration

The `manifest.yml` file defines the application's configuration, including:

- **Name:** `spring-music`
- **Memory:** 1G
- **Random Route:** Enabled
- **Path:** `build/libs/spring-music-1.0.jar`
- **Environment Variables:**
    - `JBP_CONFIG_SPRING_AUTO_RECONFIGURATION`: `{enabled: false}` (disables Spring Cloud auto-reconfiguration)
    - `SPRING_PROFILES_ACTIVE`: `http2` (enables HTTP/2 support)
    - `JBP_CONFIG_OPEN_JDK_JRE`: `{ jre: { version: 17.+ } }` (specifies Java 17)

## Data Stores

The application supports the following data stores:

- **MySQL:**  Bind a MySQL service to the application and set the `SPRING_PROFILES_ACTIVE` variable to `mysql`.
- **PostgreSQL:** Bind a PostgreSQL service to the application and set the `SPRING_PROFILES_ACTIVE` variable to `postgres`.
- **MongoDB:** Bind a MongoDB service to the application and set the `SPRING_PROFILES_ACTIVE` variable to `mongodb`.
- **Redis:** Bind a Redis service to the application and set the `SPRING_PROFILES_ACTIVE` variable to `redis`.
- **Oracle:** Bind an Oracle service to the application and set the `SPRING_PROFILES_ACTIVE` variable to `oracle`.
- **SQL Server:** Bind a SQL Server service to the application and set the `SPRING_PROFILES_ACTIVE` variable to `sqlserver`.

## Testing

The application includes unit tests for the backend components. To run the tests:

```bash
./gradlew test
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

