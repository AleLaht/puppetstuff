# H2

## Tehtävä

h2. a) Julkaise tämän kerran kotitehtävä GitHubissa, kirjoita raportti MarkDownilla. (Älä poista vanhoja weppisivujasi, linkitä tarvittaessa uuteen).

b) Asenna ja konfiguroi jokin palvelin package-file-service -tyyliin Puppetilla.

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

Vaihdoin templateen port 22 -> port 2222 ja testasin toimiiko muutos.

```
$ sudo puppet apply -e 'class {"puppetstuff":}'
$ cat /etc/ssh/sshd_config
```

## init.pp

init.pp:n luonnissa kaikki sujui hyvin ainoana ongelmana oli kuinka saan ssh servicen käynnistettyä uudelleen.
Tähän löysin ohjeet sivulta https://www.puppetcookbook.com/posts/restart-a-service-when-a-file-changes.html ja selvisi että tuon saa toimimaan kun lisää 

```puppet
notify => Service['servicename']
```

Lisäsin myös varmuuden vuoksi require
```puppet
require => Package['packagename']
```

ja kokonaisuudessaan tiedosto näyttää tältä.


```puppet
class puppetstuff {
        package {'ssh':
                ensure => 'installed',
        }
        file {'/etc/ssh/sshd_config':
                content => template('puppetstuff/sshd_config'),
                notify => Service['ssh'],
                require => Package['ssh'],
        }
        service {'ssh':
                ensure => 'running',
                require => Package['ssh'],
        }
}
```

lopuksi vielä muutin hakemistorakennetta käytännöllisemmäksi.

luomalla ssh/ kansion ja muuttamalla init.pp luokan nimeksi ssh

ssh/ kansioon siirsin manifest/ ja templates/ kansion

lopuksi pushasin tiedostot githubiin

```
$ git add .
$ git commit
$ git config --global user.email "email"
$ git config --global user.name "username"
$ git pull
$ git push
```
