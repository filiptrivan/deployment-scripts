# IIS vs Apache HTTP Server

Ovaj dokument pruža kratak pregled uporedbe IIS (Internet Information Services) i Apache HTTP Server-a na osnovu: sigurnosti, popularnosti, otvorenog koda ("open source"), kompatibilnosti sa operativnim sistemima, performansi, preopterećenja funkcionalnostima i troškova.

## 1. Sigurnost

### IIS
- Integrisan sa Windows sigurnosnim funkcionalnostima, što olakšava upravljanje kroz Windows autentifikaciju.
- Filtriranje zahteva i autorizacija URL-ova.
- Redovna ažuriranja od strane Microsoft-a.

### Apache
- Može se smatrati sigurnijim, posebno jer većina korisnika koristi Linux.
- Jake sigurnosne funkcionalnostima, zahtevaju manuelnu konfiguraciju.
- Redovna ažuriranja i podrška "open source" zajednice pomažu u rešavanju "security" problema.
- Podržava različite metode autentifikacije i kontrole pristupa.

## 2. Trenutna popularnost (https://w3techs.com/technologies/comparison/ws-apache,ws-microsoftiis,ws-nginx)

### IIS
- Po statistici sa Google-a IIS ima samo 4.5% "market share-a"
- Često se koristi u organizacijama koje se oslanjaju na Microsoft tehnologije.

### Apache
- Po statistici sa Google-a Apache ima 29% "market share-a"

### Nginx
- Po statistici sa Google-a Nginx ima čak 33.9% "market share-a"

## 3. Otvoreni Kod

### IIS
- Razvija Microsoft.
- Nije otvorenog koda.

### Apache
- Otvoreni softver licenciran pod Apache licencom.
- Besplatan za korišćenje, modifikaciju i distribuciju.

## 4. Operativni Sistem

### IIS
- Radi isključivo na Windows operativnim sistemima.

### Apache
- Višenamenski.

## 5. Performanse i Preopterećenje Funkcijama

### IIS
- Visoke performanse na Windows Server-u zbog uske integracije sa OS-om.
- Može dolaziti sa ugrađenim funkcionalnostima koje mogu biti preopterećenje za performanse ako nisu potrebne.

### Apache
- Generalno dobre performanse, ali može zahtevati dodatnu konfiguraciju za optimizaciju (isključivanje nepotrebnih funkcionalnosti).
- U kombinaciji sa Nginx-om je dosta brži.

## 6. Trošak

### IIS
- Uključen u Windows Server, koji je plaćen proizvod.
- Troškovi zavise od licenciranja Windows Server-a i bilo kojih dodatnih Microsoft proizvoda ili usluga.

### Apache
- Besplatan za korišćenje.
- Troškovi su uglavnom povezani sa operativnim sistemom, softverom ili podrškom.

## Zaključak

Oba, IIS i Apache HTTP Server, imaju svoje prednosti za različita okruženja. IIS je čvrsto vezan za Windows, dok Apache pruža fleksibilnost i jaku podršku zajednice.

Kako biste isprobali skripte, pročitajte README.md fajlove iz foldera bash i powershell.
