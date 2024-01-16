#!/bin/bash
cd /home/ubuntu
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo python3 -m pip install ansible
tee -a playbook.yml > /dev/null <<EOT
- hosts: localhost
  tasks:
    - name: Instalando o Python3, virtualenv e dependências MySQL
      apt:
        name:
          - python3
          - python3-pip
          - python3-venv
          - virtualenv
          - pkg-config
          - libmysqlclient-dev
        update_cache: yes
      become: true

    - name: Git Clone
      ansible.builtin.git:
        repo: https://github.com/ssdvd/app-cadastro-django.git
        dest: /home/ubuntu/djangoapp
        version: main
        force: yes

    - name: Instalando dependencias com pip
      pip:
        virtualenv: /home/ubuntu/djangoapp/venv
        requirements: /home/ubuntu/djangoapp/requirements.txt

    - name: iniciando o env e servidor
      shell: ". /home/ubuntu/djangoapp/venv/bin/activate; nohup python3 /home/ubuntu/djangoapp/manage.py runserver 0.0.0.0:8000 &"
EOT
ansible-playbook playbook.yml