## Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application uses Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

### Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

2. **Install dependencies:**
   ```bash
   ./gradlew build
   ```

3. **Run the application:**
   ```bash
   ./gradlew bootRun
   ```

4. **Access the application:**
   Open your browser and navigate to `http://localhost:8080/`

### Configuration

The application uses the following configuration settings:

- **Profiles:** The application can be configured to use different persistence technologies by setting the `SPRING_PROFILES_ACTIVE` environment variable.
    - `mysql`: Uses MySQL as the database.
    - `postgres`: Uses PostgreSQL as the database.
    - `mongodb`: Uses MongoDB as the database.
    - `redis`: Uses Redis as the database.
    - `http2`: Enables HTTP/2 support.

- **Service Bindings:** To connect to the databases, the application needs to be bound to the respective Cloud Foundry services. For example, to bind the application to a MySQL service named `my-mysql-service`, you can use the following command:
    ```bash
    cf bind-service my-app my-mysql-service
    ```

### Running on Cloud Foundry

To run the application on Cloud Foundry, follow these steps:

1. **Push the application to Cloud Foundry:**
   ```bash
   cf push spring-music
   ```

2. **Bind the application to the desired services:**
   Use the `cf bind-service` command to bind the application to the required services.

3. **Start the application:**
   The application will automatically start once it is deployed and bound to the necessary services.

### Contributing

We welcome contributions to this project. To contribute, please follow these steps:

1. **Fork the repository:**
   Create a fork of the repository on GitHub.

2. **Create a branch:**
   Create a new branch for your changes.

3. **Make your changes:**
   Make your changes and commit them to your branch.

4. **Submit a pull request:**
   Submit a pull request to the original repository.

### License

This project is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more information.

