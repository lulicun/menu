#!/bin/bash


#dpkg is used to install, remove,
#and provide information about .deb packages.
#Install puppet
echo 'Running provisioner...'
if ! dpkg -l | grep -qw puppet; then
    echo 'Updating sources'
    wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb >/dev/null 2>&1
    dpkg -i puppetlabs-release-precise.deb >/dev/null 2>&1
    apt-get update >/dev/null 2>&1

    echo 'Installing Puppet'
    apt-get -y install puppet >/dev/null 2>&1
else
    echo 'Puppet already installed'
fi

echo 'Installing modules:'

#This module provides a standard library of resources for the development of Puppet modules.
#Puppet modules make heavy use of this standard library.
echo 'Installing Puppet module: puppetlabs-stdlib'
if ! puppet module list --modulepath /vagrant/puppet/modules | grep -wq puppetlabs-stdlib; then
    puppet module install puppetlabs-stdlib --force --modulepath /vagrant/puppet/modules
else
    echo 'Puppet module: puppetlabs-stdlib already installed'
fi

#This module lets you use many concat::fragment{} resources throughout your modules
#to construct a single file at the end.
if ! puppet module list --modulepath /vagrant/puppet/modules | grep -wq puppetlabs-concat; then
    puppet module install puppetlabs-concat --force --modulepath /vagrant/puppet/modules
else
    echo 'Puppet module: puppetlabs-concat already installed'
fi

#The apt module automates obtaining and installing software packages on *nix systems.
if ! puppet module list --modulepath /vagrant/puppet/modules | grep -wq puppetlabs-apt; then
    puppet module install puppetlabs-apt --force --modulepath /vagrant/puppet/modules
else
    echo 'Puppet module: puppetlabs-apt already installed'
fi

#The MongoDB module manages mongod server installation and configuration of the mongod daemon.
if ! puppet module list --modulepath /vagrant/puppet/modules | grep -wq puppetlabs-mongodb; then
    puppet module install puppetlabs-mongodb --force --modulepath /vagrant/puppet/modules
else
    echo 'Puppet module: puppetlabs-mongodb already installed'
fi


# return 1 if global command line program installed, else 0
# example
# echo "node: $(program_is_installed node)"
function program_is_installed {
  # set to 1 initially
  local return_=true
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

# return 1 if local npm package is installed at ./node_modules, else 0
# example
# echo "gruntacular : $(npm_package_is_installed gruntacular)"
function npm_package_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  ls node_modules | grep $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

#Install node
if ! program_is_installed node; then
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    apt-get update
    apt-get install -y nodejs
else
    echo 'Node already installed'
fi
