menu
=================

:warning: Before You Hurt Yourself!
-----------------------------------
Master is a stable branch used for deployment. If you're developing you should be developing on another branch and submitting pull requests.


Install Webapp
--------------
git clone https://github.com/...


Running Locally
---------------
:info: Make sure [Virtualbox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html) have been installed on your machine.

In the root folder, run

    vagrant up

to start virtual machine, then

    vagrant ssh
    cd /var/www/app
    sudo npm start

to start the server. Now you should see the web application running on your local.


Development Get Started
-----------------------
Install gulp

    npm install -g gulp

    cd app
    npm install
    gulp








