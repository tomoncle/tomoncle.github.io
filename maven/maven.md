# M2 [![Build Status](https://travis-ci.org/tomoncle/m2.svg?branch=master)][travis] ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/tomoncle/m2.svg) ![GitHub repo size](https://img.shields.io/github/repo-size/tomoncle/m2.svg?color=green&logoColor=green) ![GitHub top language](https://img.shields.io/github/languages/top/tomoncle/m2.svg?color=yes) ![GitHub issues](https://img.shields.io/github/issues/tomoncle/m2.svg) ![Hex.pm](https://img.shields.io/hexpm/l/plug.svg)

---
> **本仓库属于个人的私有微型maven仓库**.  允许他人学习及工作使用，注意: 如果项目中使用了该仓库，且文件有问题，请提交issues. 
---

```LICENSE
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0
```

## Usage
* 1.Eidt your `${projectRootPath}/pom.xml` file as :
```pom.xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>${your groupId}</groupId>
    <artifactId>${your artifactId}</artifactId>
    <version>${your version}</version>
    <packaging>${your packaging}</packaging>

    <!-- ************ * Other configuration * ************ -->
    
    <!--properties configuration-->
    <properties>
        <!-- other properties ... -->
        <!-- spring-boot-config -->
        <spring.boot.config.version>2.1.2</spring.boot.config.version>
    </properties>
    
    <!--  add tomoncle m2 maven repository.  -->
    <repositories>
        <repository>
            <!--  tomoncle's private maven releases repository.  -->
            <id>tomoncle repository</id>
            <name>tomoncle Repositories</name>
            <url>https://tomoncle.github.io/repository/</url>
            <!--  github访问速度慢，使用备用地址
            <url>https://maven.tomoncle.com</url>
             -->
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
        <repository>
            <!--  snapshots repository.  -->
            <id>tomoncle snapshots</id>
            <name>tomoncle snapshots Repositories</name>
            <url>https://tomoncle.github.io/snapshots/</url>
            <!--  github访问速度慢，使用备用地址
            <url>https://snapshots-maven.tomoncle.com</url>
             -->
            <releases>
                <enabled>false</enabled>
            </releases>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </repository>
    </repositories>

    <!--  add spring-boot-config-parent dependencies.  -->
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>com.tomoncle</groupId>
                <artifactId>spring-boot-config-parent</artifactId>
                <version>${spring.boot.config.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

     <!-- ************ * Other configuration * ************ -->
</project>
```

* 2.Eidt your `${models}/pom.xml` file as :
```pom.xml
 <!-- ************ * Other configuration * ************ -->
 <dependencies>
    <!-- Other dependency... -->
    <!--spring-boot-config-->
    <dependency>
        <groupId>com.tomoncle</groupId>
        <artifactId>spring-boot-config-constants</artifactId>
    </dependency>
    <dependency>
        <groupId>com.tomoncle</groupId>
        <artifactId>spring-boot-config-errors</artifactId>
    </dependency>
    <dependency>
        <groupId>com.tomoncle</groupId>
        <artifactId>spring-boot-config-utils</artifactId>
    </dependency>
</dependencies>
<!-- ************ * Other configuration * ************ -->
```

* 3.Compile：
```bash
$ cd $projectRootPath
$ mvn clean compile
```

* 4.Look logs:
```sh
[INFO] Scanning for projects...
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-parent/2.1.2/spring-boot-config-parent-2.1.2.pom
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-parent/2.1.2/spring-boot-config-parent-2.1.2.pom (4.7 kB at 1.2 kB/s)
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config/2.1.2/spring-boot-config-2.1.2.pom
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config/2.1.2/spring-boot-config-2.1.2.pom (6.0 kB at 3.2 kB/s)
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Build Order:
[INFO] 
[INFO] mxnet-spring-samples                                               [pom]
[INFO] mxnet-spring-samples-image-recognition                             [jar]
[INFO] 
[INFO] -----------------< com.tomoncle:mxnet-spring-samples >------------------
[INFO] Building mxnet-spring-samples 1.0-SNAPSHOT                         [1/2]
[INFO] --------------------------------[ pom ]---------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:3.1.0:clean (default-clean) @ mxnet-spring-samples ---
[INFO] 
[INFO] --------< com.tomoncle:mxnet-spring-samples-image-recognition >---------
[INFO] Building mxnet-spring-samples-image-recognition 1.0-SNAPSHOT       [2/2]
[INFO] --------------------------------[ jar ]---------------------------------
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-monitor-server/2.1.2/spring-boot-config-monitor-server-2.1.2.pom
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-monitor-server/2.1.2/spring-boot-config-monitor-server-2.1.2.pom (2.9 kB at 1.8 kB/s)
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-monitor-client/2.1.2/spring-boot-config-monitor-client-2.1.2.pom
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-monitor-client/2.1.2/spring-boot-config-monitor-client-2.1.2.pom (2.2 kB at 1.2 kB/s)
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-constants/2.1.2/spring-boot-config-constants-2.1.2.pom
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-constants/2.1.2/spring-boot-config-constants-2.1.2.pom (524 B at 224 B/s)
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-errors/2.1.2/spring-boot-config-errors-2.1.2.pom
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-errors/2.1.2/spring-boot-config-errors-2.1.2.pom (974 B at 522 B/s)
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-utils/2.1.2/spring-boot-config-utils-2.1.2.pom
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-utils/2.1.2/spring-boot-config-utils-2.1.2.pom (1.6 kB at 882 B/s)
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-monitor-server/2.1.2/spring-boot-config-monitor-server-2.1.2.jar
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-constants/2.1.2/spring-boot-config-constants-2.1.2.jar
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-monitor-client/2.1.2/spring-boot-config-monitor-client-2.1.2.jar
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-errors/2.1.2/spring-boot-config-errors-2.1.2.jar
Downloading from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-utils/2.1.2/spring-boot-config-utils-2.1.2.jar
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-monitor-server/2.1.2/spring-boot-config-monitor-server-2.1.2.jar (3.4 kB at 2.1 kB/s)
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-monitor-client/2.1.2/spring-boot-config-monitor-client-2.1.2.jar (2.2 kB at 951 B/s)
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-utils/2.1.2/spring-boot-config-utils-2.1.2.jar (21 kB at 8.1 kB/s)
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-constants/2.1.2/spring-boot-config-constants-2.1.2.jar (2.7 kB at 761 B/s)
Downloaded from tomoncle: https://tomoncle.github.io/repository/com/tomoncle/spring-boot-config-errors/2.1.2/spring-boot-config-errors-2.1.2.jar (11 kB at 2.1 kB/s)
[INFO] 
[INFO] --- maven-clean-plugin:3.1.0:clean (default-clean) @ mxnet-spring-samples-image-recognition ---
[INFO] Deleting /home/tomoncle/workspace/java/github.com/tomoncle/mxnet-spring-samples/mxnet-spring-samples-image-recognition/target
[INFO] 
[INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ mxnet-spring-samples-image-recognition ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 0 resource
[INFO] Copying 1 resource
[INFO] 
[INFO] --- maven-compiler-plugin:3.8.0:compile (default-compile) @ mxnet-spring-samples-image-recognition ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 4 source files to /home/tomoncle/workspace/java/github.com/tomoncle/mxnet-spring-samples/mxnet-spring-samples-image-recognition/target/classes
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for mxnet-spring-samples 1.0-SNAPSHOT:
[INFO] 
[INFO] mxnet-spring-samples ............................... SUCCESS [  0.148 s]
[INFO] mxnet-spring-samples-image-recognition ............. SUCCESS [ 16.853 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  23.492 s
[INFO] Finished at: 2019-04-30T13:24:38+08:00
[INFO] ------------------------------------------------------------------------
```

[travis]: https://travis-ci.org/tomoncle/m2
