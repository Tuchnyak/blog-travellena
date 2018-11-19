# Private blog platform

*Spring WebMVC, Security, Hibernate, MySQL*

*NO XML configuration*

This web-application allows an owner to perform CRUD-operations with articles which are stored in MySQL database. Access to admin's functions has provided by a login form using Spring Security.

**Features**
* View JSP pages use [Bootstrap](http://getbootstrap.com) and jsp-tag templating
* Articles editing provides by [TinyMCE](https://www.tiny.cloud) WYSIWYG editor
* JSP tags for the new java.time package present in Java 8 by [Sergi Baila](https://github.com/sargue) with [java-time-jsptags](https://github.com/sargue/java-time-jsptags) 
* Support for Java8 Date/Time by [hibernate-java8](https://mvnrepository.com/artifact/org.hibernate/hibernate-java8)
* It is assumed that images and videos for articles are stored on third-party resources and inserted by reference, using the functions of the built-in text editor (TinyMCE). <br> To embed pictures from Google Photos it is recommended to use the [extracting tool](https://www.publicalbum.org/blog/embedding-google-photos-image) provided by [Pavex](https://www.publicalbum.org/blog/about-pavex)

<br>

---
**Note:**<br>
To operate with database you have to add jdbc connection using <b><u>jdbc-mysql.properties</u></b> file in the directory <b>`src/main/resources`</b>:

```java
#
# JDBC connection properties
#
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/db_name?useSSL=false&serverTimezone=UTC
jdbc.user=yourusername
jdbc.password=yourPassword
```

---

