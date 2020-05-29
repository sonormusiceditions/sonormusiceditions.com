# Sonor Music Editions

### Aggiungere nuovo prodotto

1. Entrare nella cartella della relativa categoria.
  - [Catalog](https://github.com/sonormusiceditions/prova/tree/master/_catalog)
  - [Publishing](https://github.com/sonormusiceditions/prova/tree/master/_merchandise)
  - [Merchandise](https://github.com/sonormusiceditions/prova/tree/master/_publishing)

1. Premere `Create new file` in alto a destra inserire: il nome della cartella del prodotto e il nome della pagina web (con estensione markdown `.md`), separati da uno slash `/`.

  Esempi

  - `65/IL_DIO_SOTTO_LA_PELLE_OST.md`
  - `10-situazioni/10-situazioni.md`
  - `baseball-t-shirt/baseball-t-shirt.md`

1. Nella finestra `<> Edit new file` inserire: i metadata per il prodotto, la descrizione e l'eventuale codice player embed. In caso di testi lunghi, cambiare la visualizzazione tramite la tendina `No wrap` in alto a destra.
  
  Esempi
  
  ```yml
  ---
  title: IL DIO SOTTO LA PELLE OST
  author: PIERO PICCIONI
  volume: SME 65
  date: 3 Feb 2020
  ---
  
  Descrizione...
  
  Codice player embed...
  ```
  
  ```yml
  ---
  title: Baseball T-SHIRT
  author: Apparel
  date: September 18, 2019
  buy: https://sonormusiceditions.bandcamp.com/merch/sonor-music-editions-light-grey-t-shirt
  ---
  
  Descrizione
  ```
  
1. Per pubblicare la pagina premere `Commit new file` in fondo alla pagina. Il sito verrà aggiornato entro un minuto.

#### Metadata

Possibili metadata da inserire nell'intestazione del file, delimitati dai trattini `---`

- `title:` Titolo del prodotto
- `author:` Autore della release oppure sottocategoria, esempio `Apparel`
- `volume:` Eventuale volume, esempio `SME 1`
- `date:` Data dell'uscita, utilizzato per ordinare i prodotti nella griglia dell categoria
- `but:` Eventuale link esterno `BUY HERE`, esempio [baseball-t-shirt.md](https://github.com/sonormusiceditions/prova/edit/master/_merchandise/baseball-t-shirt/baseball-t-shirt.md)
- `image:` Eventuale indirizzo `url` dell'immagine di copertina
- `gallery:` Eventuale lista di indirizzi `url` alle immagini della gallery, esempio [spell.md](https://github.com/sonormusiceditions/prova/edit/master/_catalog/spell/spell.md)

#### Copertina

Specificare l'immagine di copertina (utilizzata nella griglia delle categorie) in uno dei seguenti modi:

- Trascinare il file dell'immagine, rinominato con nome `0.jpg`, nella cartella del prodotto.

  Esempio [_catalog/65](https://github.com/sonormusiceditions/prova/tree/master/_catalog/65)
- Se l'immagine è gia pubblicata su internet, incollare il relativo indirizzo `url` nell'intestazione del file usando il metadata `image: ...`.

  Esempio [freedom-power.md](https://github.com/sonormusiceditions/prova/edit/master/_catalog/1/freedom-power.md)

#### Galleria

Specificare le immagini della gallery (visualizzate nella pagina del prodotto, alla destra di un eventuale player) in uno dei seguenti modi:

- Trascianre i file delle immagini, rinominati con nomi `1.jpg`, `2.jpg` ..., nella cartella del prodotto.

  Esempio [_catalog/65](https://github.com/sonormusiceditions/prova/tree/master/_catalog/65)
- Se le immagini sono già pubblicate su internet, incollare i relativi indirizzi `url` nell'intestazione del file usando il metadata `gallery: ...` ed elencando gli indirizzi alle immagini usando il trattino `-`.
  
  Esempio
  
  ```yml
  gallery:
  - indirizzo url prima immagine
  - indirizzo url seconda immagine
  ```

### Modificare nuovo prodotto

Entrare nella cartella della relativa categoria e poi dello specifico prodotto, cliccare sul file `.md` e modificarlo premendo il simbolo della matita in alto a destra.
Per pubblicare le modifiche premere `Commit changes` in fondo alla pagina.
Esempio [IL_DIO_SOTTO_LA_PELLE_OST.md](https://github.com/sonormusiceditions/prova/edit/master/_catalog/65/IL_DIO_SOTTO_LA_PELLE_OST.md)