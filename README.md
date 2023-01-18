# Ansible - Event Driven Ansible

## How install?

```bash
ansible-galaxy install ansible.eda
ansible-playbook ansible.eda.install_rulebook_cli -i localhost, -vK
source ~/.bashrc # https://github.com/ansible/event-driven-ansible/issues/69
python3 -m pip install --user aiohttp # https://github.com/ansible/event-driven-ansible/issues/69
sudo dnf install tmux # used in the start.sh script
```

## How run?

```bash
./start.sh
```