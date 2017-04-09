# H2

## Tehtävä

## Github

Aloitin tehtävän asentamalla git paketin

```
$ sudo apt-get install git
```

kloonaamalla jo valmiiksi tekemäni repon "puppetstuff", kansion /etc/puppet/modules/ alle

```
$ git clone 
```

Tämän jälkeen loin kansion manifests/ ja templates/

```
$ sudo mkdir manifests/
$ sudo mkdir templates/
```

asensin ssh:n ja kopioin sshd_config tiedoston luomaani templates/kansioon

```
$ sudo apt-get install ssh
$ sudo cp /etc/ssh/sshd_config /etc/puppet/modules/puppetstuff/templates/
```




