#! /bin/bash
# install git lfs 
# https://github.com/tomoncle

ubuntu="/etc/lsb-release"
centos="/etc/redhat-release"

git lfs > /dev/null 2>&1
if [ $? -ne 0 ]
then
    if [ -f $ubuntu ]
    then
        wget https://www.tomoncle.com/download/git/git-lfs_2.7.2_amd64.deb
        sudo dpkg -i git-lfs_2.7.2_amd64.deb
        rm git-lfs_2.7.2_amd64.deb
    elif [ -f $centos ]
    then
        wget https://www.tomoncle.com/download/git/git-lfs-2.7.2-1.el7.x86_64.rpm
        rpm -ivh git-lfs-2.7.2-1.el7.x86_64.rpm
        rm git-lfs-2.7.2-1.el7.x86_64.rpm
    else
        echo "visit https://packagecloud.io/github/git-lfs/install to install git-lfs."
        exit 1
    fi
fi 

if [ $? -eq 0 ]
then
    git lfs install
fi
