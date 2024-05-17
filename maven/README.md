# M2 [![Build Status](https://travis-ci.org/tomoncle/m2.svg?branch=master)][travis] ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/tomoncle/m2.svg) ![GitHub repo size](https://img.shields.io/github/repo-size/tomoncle/m2.svg?color=green&logoColor=green) ![GitHub top language](https://img.shields.io/github/languages/top/tomoncle/m2.svg?color=yes) ![GitHub issues](https://img.shields.io/github/issues/tomoncle/m2.svg) ![Hex.pm](https://img.shields.io/hexpm/l/plug.svg)

---
> **友情提示：本仓库仅用于测试目的，不用于商业用途！**. 
---

```LICENSE
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0
```

## 使用说明

* 在maven项目根目录下的 `pom.xml` 中添加下面内容, 来启用该仓库 :
```pom.xml
<repositories>
    <repository>
        <id>github</id>
        <name>github Repositories</name>
        <url>https://tomoncle.github.io/maven/repository</url>
    </repository>
</repositories>
```

* 编译
```bash
$ cd $projectRootPath
$ mvn clean compile
```

[travis]: https://travis-ci.org/tomoncle/m2
