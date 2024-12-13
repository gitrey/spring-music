Spring Music
============

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application demonstrates storing domain objects using different persistence technologies, including MySQL and PostgreSQL (relational), MongoDB (document), and Redis (key-value). This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

The application use Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Database Configuration

This application uses Spring profiles to configure the database connection.  You can specify the desired database by setting the `spring.profiles.active` property.

**MySQL:** To use MySQL, set the profile to `mysql`.  Connection details can be configured in the `application.yml` file under the `mysql` profile.  See the example configuration in the `application.yml` file.

**PostgreSQL:** To use PostgreSQL, set the profile to `postgres`. Connection details can be configured in the `application.yml` file under the `postgres` profile. See the example configuration in the `application.yml` file.

**Redis:** To use Redis, set the profile to `redis` and ensure that a Redis service is bound to the application.  Connection details will be automatically configured using `Java CFEnv`.

**MongoDB:** To use MongoDB, set the profile to `mongodb` and ensure that a MongoDB service is bound to the application. Connection details will be automatically configured using `Java CFEnv`.


