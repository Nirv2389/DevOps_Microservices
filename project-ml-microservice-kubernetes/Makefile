## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	sudo apt install python3.7
	sudo apt install python3-pip
	sudo apt update
	sudo apt install python3-venv
	sudo apt update
	sudo ln -s /usr/lib/python3/dist-packages/apt_pkg.cpython-{36m,37m}-x86_64-linux-gnu.so
	sudo ln -s /usr/lib/python3/dist-packages/gi/_gi.cpython-{36m,37m}-x86_64-linux-gnu.so
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
	python3 -m venv ~/.devops
	source ~/.devops/bin/activate
install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt &&\
		pip install pylint
	
	sudo apt-get install \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common
	
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	apt-key fingerprint 0EBFCD88
	
	sudo add-apt-repository \
   	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	bionic \
   	stable"
	
	sudo apt-get install docker-ce=5:18.09.9~3-0~ubuntu-bionic  docker-ce-cli=5:18.09.9~3-0~ubuntu-bionic containerd.io
	sudo docker pull hadolint/hadolint
test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	sudo docker run --rm -i hadolint/hadolint < Dockerfile	
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

all: install lint test
