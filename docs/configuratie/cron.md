# Automatisch importeren

Op de module configuratiepagina kunt u klikken op `bekijk geavanceerde opties`, daar staat een link naar een script die een synchronisatie uitvoert.

De link bevat een secret key, zodat alleen u de synchronisatie kunt aanroepen. De url ziet eruit als:

***http://www.uwdomeinnaam.nl/modules/bolplaza/cron.php?secure_key=UW_SECURE_KEY***

Het is erg aan te raden om een crontaak in te richten die dit script elk kwartier aanroept. Het uitvoeren van het script is een lichte taak, en kan dus vaak gebeuren. U kunt een crontaak maken zoals:

```bash
*/10 * * * * curl --silent http://www.uwdomeinnaam.nl/modules/bolplaza/cron.php?secure_key=UW_SECURE_KEY &>/dev/null
```

Deze taak haalt elke 10 minuten nieuwe orders op van Bol.com.
