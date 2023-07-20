# Ansible Playbooks

All of `ansible-playbooks`, `roles` and `inventories` are here.To use them
follow the structure:

1. Make sure that `ansible` is already installed on your host. If not , Run the
   commands below:

```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

2. Make sure that you have `ssh access` to the servers **without password** 
   that you want to run your `playbook`.

```bash
ssh-copy-id <USER>@<SERVER_IP>
```

3. You need to generate a host file for ansible to read hosts from it.So run:

```bash
chmod +x inventory/host-generator.sh
```

then

```bash
./inventory/host-generator.sh
```

follow the structure and generate the host file in inventory directory.

4. Last step to run your `playbook` is to run:

```bash
ansible-playbook -i inventory/hosts playbooks/<$PLAY_BOOK_NAME>.yml
```

Be aware that if your playbook needs `sudo` password, you'll get this error:

```bash
TASK [Gathering Facts] ******************************************************
fatal: [$SOME_IP]: FAILED! => {"msg": "Missing sudo password"}
```

To solve the issue , please run the command below:

```bash
ansible-playbook -K -i inventory/hosts playbooks/<$PLAY_BOOK_NAME>.yml
```

when you run the command above you will be prompt to type your `sudo`
password,type it and be patient.

5. And Finaly you can check the result in servers.

done.
