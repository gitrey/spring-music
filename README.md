## Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application use Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Getting Started

1. **Prerequisites**
    * [Java Development Kit (JDK) 17 or higher](https://www.oracle.com/java/technologies/downloads/)
    * [Gradle](https://gradle.org/install/)
    * [Cloud Foundry CLI](https://docs.cloudfoundry.org/devguide/installcli.html)
    * [Cloud Foundry Account](https://cloudfoundry.org/get-started/)

2. **Clone the repository**
    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

3. **Build the application**
    ```bash
    ./gradlew build
    ```

4. **Deploy the application**
    * Create a Cloud Foundry service for the chosen database technology. For example:
        * `cf create-service p-mysql 1GB my-mysql-service`
        * `cf create-service p-mongodb 1GB my-mongodb-service`
        * `cf create-service p-redis 1GB my-redis-service`
    * Update the `manifest.yml` file with your service names and desired resource allocation.
    * Deploy the application: `cf push`

5. **Access the application**
    * Once the application is deployed, you can access it via the provided URL in the Cloud Foundry CLI output.
    * Interact with the application using the provided UI or API endpoints.


## Running in development mode

For development purposes, you can run the application locally using the built-in embedded web server:

```bash
./gradlew bootRun
```

You can then access the application via `http://localhost:8080`.

## Supported Databases

The application supports the following database technologies through service binding on Cloud Foundry:

* **MySQL:**  `p-mysql`
* **PostgreSQL:**  `p-postgresql`
* **MongoDB:** `p-mongodb`
* **Redis:** `p-redis`
* **Oracle:**  `p-oracle` (requires additional steps - see below)
* **SQL Server:** `p-sqlserver` (requires additional steps - see below)

## Using Oracle and SQL Server

1. **Download and install the drivers:**
    * Obtain the appropriate driver for your database version. 
    * Place the driver JAR file in the `./libs` directory.

2. **Include driver in Gradle dependencies:**
    * Uncomment the corresponding line in `build.gradle`.

3. **Set the environment variables:**
    * Update the `application.yml` file with the correct database connection information, including URL, username, and password.
    * Set the necessary environment variables when running on Cloud Foundry.

## Contributing

Contributions are welcome! Please follow these guidelines:

1. **Fork the repository**
2. **Create a new branch**
3. **Make your changes**
4. **Test your changes**
5. **Submit a pull request**

Please follow our code style guidelines and ensure your changes are well-documented.

## License

This project is licensed under the Apache 2.0 License.

## Contact

For any inquiries or support requests, please open an issue on our GitHub repository.

