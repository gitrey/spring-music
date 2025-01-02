# Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application use Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Running Locally

To run the application locally, you can use the following steps:

1. **Configure a database:** You will need to have a database running locally (e.g., MySQL, PostgreSQL, MongoDB, Redis).
2. **Set environment variables:**
   - `SPRING_PROFILES_ACTIVE`: The database you want to use (e.g., `mysql`, `postgres`, `mongodb`, `redis`).
   - Database specific environment variables (e.g., `MYSQL_HOST`, `MYSQL_DATABASE`, `MYSQL_USER`, `MYSQL_PASSWORD`).
3. **Run the application:**
   ```bash
   ./gradlew bootRun
   ```

## Deploying to Cloud Foundry

1. **Create a Cloud Foundry account and login.**
2. **Push the application:**
   ```bash
   cf push
   ```

This will deploy the application to Cloud Foundry and bind the required services. The application will be accessible via the generated URL.

## Using the Application

The application exposes a REST API for managing albums:

- **`GET /albums`** - Lists all albums.
- **`PUT /albums`** - Adds a new album.
- **`POST /albums`** - Updates an existing album.
- **`GET /albums/{id}`** - Gets an album by ID.
- **`DELETE /albums/{id}`** - Deletes an album by ID.

The application also includes a web UI for managing albums.

## Contributing

We welcome contributions! To contribute:

1. Fork the repository.
2. Create a branch for your changes.
3. Make your changes and commit them.
4. Submit a pull request for review.

## License

This project is licensed under the Apache License, Version 2.0 - see the [LICENSE](LICENSE) file for details.

