# Prestashop producten op Bol.com
Na het installeren van de module zijn er nieuwe opties in het menu van Prestashop gekomen. Een daarvan is `Catalogus` -> `Bol.com producten`. Wanneer u daar naartoe navigeert, ziet u een overzicht van alle producten in het systeem die op Bol.com gepubliceerd worden.

![Bol.com products](../img/overview_products.png)

## Producten selecteren
Binnen Prestashop kunt u nu per product instellen hoe deze op Bol.com weergegeven dient te worden. Op de product bewerkpagina (onder `Catalogus`) vindt u een tab met de titel `Bol.com Plaza API connector`. Op die tab staan de instellingen voor Bol.com.

![Bol.com products](../img/overview_producttab.png)

Op deze tab ziet u voor alle productcombinaties een optie om deze te publiceren (via het vinkje onder `Publiceren`). Ook kunt u per combinatie een Bol.com geadverteerde prijs instellen (in het veld `Specifieke prijs`). Klik voor een product aan dat deze op Bol.com gepubliceerd moet worden.

## Producten synchroniseren
Wanneer er een nieuw product wordt geselecteerd voor Bol.com, wordt deze direct naar Bol.com gemeld. Daarmee komt de status van dat product op `OK`. U kunt de status van de productsynchronisatie inzien op de `Catalogus` -> `Bol.com products` pagina. Indien de melding naar Bol.com mislukt, staat de status nog op `Nieuw`.

De volgende statussen zijn mogelijk voor een Bol.com publicatie:

* `OK` - Dit product is correct naar Bol.com gemeld
* `Nieuw` - Dit product is nieuw en nog niet naar Bol.com gemeld
* `Voorraad bijgewerkt` - Van dit product is de voorraad bijgewerkt, maar nog niet naar Bol.com gemeld
* `Info bijgewerkt` - Van dit product is de informatie bijgewerkt, maar nog niet naar Bol.com gemeld

Als er in het productenoverzicht een andere status dan `OK` staat, kan via de knop `Synchroniseer producten` bovenin de synchronisatie handmatig worden gestart. Indien er foutmeldingen ontstaan tijdens de synchronisatie krijgt u een bericht. Wanneer de API onbeschikbaar is kunt u het later nog eens proberen, maar als er foutieve data gestuurd is, moet u de produten wellicht aanpassen.

## Veelgestelde vragen

### Hoe zet ik een afbeelding bij een product?

Helaas is deze functie nog niet beschikbaar via de Plaza API van Bol.com. U kunt alleen nieuwe producten toevoegen via de Bol.com interface. Daar kunt u ook uw productinformatie beheren (zoals afbeeldingen).

### Moet ik alle producten handmatig langslopen?

Indien u toegang hebt tot de database kunt u de producten ook direct in de tabel toevoegen. U dient daarna nog wel de synchronisatie handmatig aan te zetten. Hieronder staat een (voorbeeld) van een SQL query om de producten te selecteren. In deze situatie is er een Database Prefix van `ps_` gebruikt en een shop ID van `1`, deze gegevens moet wellicht voor uw situatie aangepast worden.

Verwijder eerst alle huidige Bol.com producten uit de tabel

    DELETE FROM ps_bolplaza_product WHERE id_bolplaza_product > 0;

Voeg de bestaande producten toe (met een dezelfde prijs)

```sql
INSERT INTO ps_bolplaza_product
  (id_product, id_product_attribute, id_shop, published, price, status)
SELECT p.id_product, IFNULL(a.id_product_attribute, 0) as id_product_attribute, s.id_shop, 1 as published, 0 as price, 1 as status
FROM ps_product p
LEFT JOIN ps_product_shop s ON s.id_product = p.id_product
LEFT JOIN ps_product_attribute a ON a.id_product = p.id_product
WHERE s.id_shop = 1;
```

**Of** voeg de bestaande producten toe met een verhoogde prijs van € 5.

```sql
INSERT INTO ps_bolplaza_product
  (id_product, id_product_attribute, id_shop, published, price, status)
SELECT p.id_product, IFNULL(a.id_product_attribute, 0) as id_product_attribute, s.id_shop, 1 as published, ROUND(p.price * 1.21, 2) + 5 as price, 1 as status
FROM ps_product p
LEFT JOIN ps_product_shop s ON s.id_product = p.id_product
LEFT JOIN ps_product_attribute a ON a.id_product = p.id_product
WHERE s.id_shop = 1;
```
