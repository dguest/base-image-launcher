SSH keys directory
------------------

You can put your ssh keys in here. They will be ignored by git but
they will also be mapped in containers.

You probably want to create some keys for github and gitlab, and also
a `config` file something like this

```
Host gitlab.cern.ch
  User git
  Hostname gitlab.cern.ch
  IdentityFile ~/.ssh/gitlab

Host github.com
  User git
  Hostname github.com
  IdentityFile ~/.ssh/github
```


