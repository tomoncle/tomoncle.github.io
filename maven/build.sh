#! /bin/bash
# author: tomoncle

case $1 in
    release | R)
        echo "start build release files."
        DEPLOY_TYPE="R"
    ;;
    snapshot | S)
        echo "start build snapshot files."
        DEPLOY_TYPE="S"
    ;;
    *)
        echo "Please input release(R) or snapshot(S) to select the deploy type."
        exit
    ;;
esac

TEMP_REPO=$(mktemp -d)
CD=$(dirname $(pwd)/$0)

if [ -z ${M2_REPO} ] || [ -z ${BUILD_PROJECT} ]; then echo RVJST1I6IG5vdCBmb3VuZCBlbnYgJ00yX1JFUE8nIGFuZCAnQlVJTERfUFJPSkVDVCcKCk0yX1JFUE8gICAgICAgOiBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL3RvbW9uY2xlL3RvbW9uY2xlLmdpdGh1Yi5pbyBtMgpCVUlMRF9QUk9KRUNUIDogZGVwbG95IHByb2plY3QgcGF0aAoKZm9yIGV4YW1wbGUsIHlvdSBuZWVkIHNldCBlbnYgZm9yIHNhbWUgYXM6CgogICQgZXhwb3J0IE0yX1JFUE89L2hvbWUvdG9tb25jbGUvd29ya3NwYWNlL2Jhc2gvbTIKICAkIGV4cG9ydCBCVUlMRF9QUk9KRUNUPS9ob21lL3RvbW9uY2xlL3dvcmtzcGFjZS9qYXZhL2dpdGh1Yi5jb20vdG9tb25jbGUvc3ByaW5nLWJvb3QtY29uZmlnCgo= | base64 -d; exit 1; fi
if [ -z ${GITHUB_USERNAME} ] || [ -z ${GITHUB_PASSWORD} ]; then echo RVJST1I6IG5vdCBmb3VuZCBlbnYgJ0dJVEhVQl9VU0VSTkFNRScgYW5kICdHSVRIVUJfUEFTU1dPUkQnCgpmb3IgZXhhbXBsZSwgeW91IG5lZWQgc2V0IGVudiBmb3Igc2FtZSBhczoKCiAgJCBleHBvcnQgR0lUSFVCX1VTRVJOQU1FPWZvbwogICQgZXhwb3J0IEdJVEhVQl9QQVNTV09SRD1iYXIK | base64 -d; exit 1; fi 
if [ ! -d "${M2_REPO}" ]; then echo "ERROR: ${M2_REPO} does not exist."; exit 1; fi
if [ ! -d "${BUILD_PROJECT}" ]; then echo "ERROR: ${BUILD_PROJECT} does not exist."; exit 1; fi
if [ ! -d "${TEMP_REPO}" ]; then mkdir "${TEMP_REPO}"; else rm -rf "${TEMP_REPO}"/* ; fi

release=$(source <(curl -s https://bash.tomoncle.com/.bashrc) && echo $(checkos))
if [ $release == "centos" ]; then
    rpm -q expect &> /dev/null || yum -y install expect || { echo "Error installing Expect on CentOS"; exit 1; } 
else
    dpkg -s expect &> /dev/null || apt-get -y install expect || { echo "Error installing Expect on Debian/Ubuntu"; exit 1; }
fi
GIT_PUSH_CALLBACK=`which expect`

cd ${BUILD_PROJECT}
# deploy jar files to tmp dir
mvn clean deploy -Dmaven.test.skip  -DaltDeploymentRepository=self-mvn-repo::default::file:${TEMP_REPO}
mvn clean source:jar deploy -Dmaven.test.skip=true -DaltDeploymentRepository=self-mvn-repo::default::file:${TEMP_REPO}

# overwrite or create deploy files
# if snapshots : "$ cp -rf ${TEMP_REPO}/* $M2_REPO/snapshots/"
if [ "$DEPLOY_TYPE" == "R" ] 
then
    cp -rf ${TEMP_REPO}/* ${M2_REPO}/maven/repository/
else
    cp -rf ${TEMP_REPO}/* ${M2_REPO}/maven/snapshots/
fi 

# commit your new files
cd ${M2_REPO}
# ignore files
git update-index --assume-unchanged build.sh
git update-index --assume-unchanged repository/index.html
git update-index --assume-unchanged snapshots/index.html
# set userinfo
git config user.name "GitHub Actions"
git config user.email "github-actions@github.com"
# push
git pull origin master
git add ./
git commit -am "workflow build a package using Maven and then publish it to GitHub"
#git push origin master
${GIT_PUSH_CALLBACK} << EOF
    set timeout 30
    spawn git push origin master
    expect {
        "Username for*" { send "${GITHUB_USERNAME}\r"; exp_continue }
        "Password for*" { send "${GITHUB_PASSWORD}\r" }
    }
    expect eof
EOF

rm -rf ${TEMP_REPO}
echo "success."
cd $CD
