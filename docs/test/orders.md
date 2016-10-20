# Orders testen
De eerste test die uitgevoerd dient te worden is de orders synchronisatie.

***Kijk goed na of u de module in [testmodus heeft geconfigureerd](../configuratie/module.md)***

Na het installeren van de module zijn er nieuwe opties in het menu van Prestashop gekomen. Een daarvan is `Bestellingen` -> `Bol.com orders`. Wanneer u daar naartoe navigeert, ziet u een overzicht van alle Bol.com bestellingen in het systeem.

![Bol.com orders](../img/overview_orders.png)

## Testproduct aanmaken
Om de test te kunnen gebruiken dient u eerst een product te hebben die correspondeert met het product dat Bol.com gaat melden. Hiervoor is het nodig om een product in Prestashop aan te maken (of tijdelijk een bestaand product te wijzigen).

1. Maak een (tijdelijk) product, bijv. `Bol.com testproduct`.
2. Vul een naam voor het product in.
3. Vul een referentiecode voor het product in.
4. Vul bij de `EAN-13 of JAN-streepjescode` de code `9789062387410` in.
5. Zorg ervoor dat het product op voorraad is (dus bestelbaar)
6. Zet het product in een categorie
7. Sla het product op

## Orders verkrijgen
Navigeer naar `Bestellingen` -> `Bol.com orders`. Als het goed is ziet u bovenin 2 knoppen: `Synchroniseer bestellingen` en `Verwijder testdata`.

***Let op: Indien u `Verwijder testdata` niet ziet hebt u de module niet in testmodus staan! Ook moet u eerst een testproduct hebben aangemaakt, zie hierboven***

Klik bovenin op de knop `Synchroniseer bestellingen`. U ontvangt nu als het goed is 2 testorders van Bol.com. Beide orders bevatten een product `Harry Potter`. Beide orders hebben `Hoeveelheid` 2 en `EAN` 9789062387410. Wanneer u op 1 van de orders klikt gaat u naar het standaard Prestashop orderscherm. In dit orderscherm ziet u bij het veld `Betaling` het Bol.com Transactie ID. Dit is de Bol.com orderreferentie.

![Bol.com orders](../img/overview_order_reference.png)

U kunt nu een trackingnummer aan de order toevoegen, dit nummer zal naar Bol.com gemeld worden.

## Verwijder testdata
U kunt de orders verwijderen via de knop `Verwijder testdata`. De orders en alle verwante informatie (orderregels, klanten etc.) zullen worden verwijderd.
