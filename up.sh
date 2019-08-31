#!/bin/bash

ansible-playbook -i inventory.yml --vault-password-file=secret.txt standup.yml
