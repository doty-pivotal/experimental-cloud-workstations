## Scratch

There are some competing concerns, but lets try this pattern on:
1. workstation setup
2. product setup
3. team setup
4. Individuals setup

This way by combining choices in 1-4 you get your workstation.  There may be
some conflicts, but I think I want to see this play out, and then figure out
how to consolidate and refactor


## Ansible Thoughts:

+ [Ansible Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)
+ [Ansible Examples](https://github.com/ansible/ansible-examples)
+ [Ansible and Vagrant](https://www.vagrantup.com/docs/provisioning/ansible_intro.html)

Thinking about roles:

```
.
├── README.md
├── Vagrantfile
└── provisioning
    ├── site.yml
    ├── developer-workstation.yml
    ├── gpdb-node.yml
    └── roles
        ├── gpdb-build-req
        ├── gpdb-workflow < can have scripts to switch cleanly between versions
        ├── ...
        ├── gpupgrade-build-req
        ├── gpupgrade-workflow < can set languages used in these projects for consumption downstream?
        ├── ...
        ├── team-workflow # < this can have collaboration tools, tmux, mosh, git author, ...
        ├── editor # < can this build off of list of languages set as vars from above ??
        ├── desktop
        ├── ...
        ├── gpdb-runtime < nodes shouldn't need all the cruft needed to develop GPDB
        └── ...
 ```

Next steps:
1. from blanck VM, build GPDB
1. from build GPDB VM add developer workflow tools
1. from workstation build / manage a cluster.
1. do above in GCP

One thing that would be nice is if there was a way from the build VM to push
the latest changes to the cluster.  Perhaps the install prefix on the build VM
could be an NFS that all the other nodes mount (Morgan Stanley anyone?).  Or
perhaps a job that runs to sync the directories? Or an ansible
[solution](https://stackoverflow.com/questions/25505146/how-to-copy-files-between-two-nodes-using-ansible)?


Also, when working on VM's on a laptop, can see wanting to control the whole
thing from the outside.  If my workstation is in GCP, I kind of want the tools
on it to be able to spin out the dev cluster and connect to it.
