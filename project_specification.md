# MCP UNIVERSE - Projektin Erittely

©ojkotka

## 1. Yleiskatsaus

MCP UNIVERSE on vallankumouksellinen alusta, joka tekee perinteisistä API:ista vanhentuneita mahdollistamalla tekoälyjen dynaamisen työkalujen löytämisen, neuvottelun ja ratkaisujen koostamisen parhaista saatavilla olevista työkaluista reaaliaikaisesti. Se tarjoaa universaalin leikkikentän Model Context Protocols (MCP) -protokollille, joka mahdollistaa dynaamisen työkalujen löytämisen, suorittamisen ja jakamisen.

**Visio:** Luoda perustavanlaatuinen protokolla ja orkestraattori, joka tekee perinteisistä API:ista vanhentuneita mahdollistamalla tekoälyjen dynaamisen löytämisen, neuvottelun ja ratkaisujen koostamisen parhaista saatavilla olevista työkaluista koko universumissa reaaliaikaisesti.

## 2. Tekninen Arkkitehtuuri ja Komponentit

MCP UNIVERSE on rakennettu modulaarisella, mikropalvelukeskeisellä arkkitehtuurilla, joka koostuu seuraavista ydinkomponenteista:

### 2.1. Nexus Gateway (Rust-toteutus)

*   **Toiminto:** Ensisijainen sisääntulopiste kaikille yhteyksille.
*   **Vaatimukset:**
    *   Tukee useita kuljetusprotokollia (SSE, STDIO, Docker, HTTP).
    *   Käsittelee todennuksen ja nopeusrajoitukset.
    *   Hallinnoi yhteyspoolia ja uudelleenkäyttöä.
    *   Toteuttaa krediittien seurannan tapahtumaa kohden.
*   **Teknologia:** Rust Axum-kehyksellä, Tokio-ajonaikainen ympäristö.

### 2.2. Intelligent Router & Orchestrator (Rust)

*   **Toiminto:** Dynaaminen työkalujen löytäminen ja valinta.
*   **Vaatimukset:**
    *   Luottamukseen perustuva pisteytysalgoritmi (kustannus 30%, viive 30%, maine 40%).
    *   Reaaliaikainen palveluntarjoajan valintalogiikka.
    *   Tuki samanaikaiselle työkalujen suorittamiselle.
    *   Mukautuva reititys suorituskykymittareiden perusteella.
*   **Teknologia:** Rust matemaattisten optimointikirjastojen kanssa.

### 2.3. Trust Graph Engine (PostgreSQL)

*   **Toiminto:** Hajautettu maineenhallinta.
*   **Vaatimukset:**
    *   Palveluntarjoajan pisteytysjärjestelmä (0-5 asteikko).
    *   Attestaatioiden tallennus ja validointi.
    *   Petoksentunnistusmekanismit (sybil-hyökkäykset, pisteytyspiikit).
    *   Web-of-trust-toteutus.
*   **Teknologia:** PostgreSQL graafilaajennusominaisuuksilla.

### 2.4. Universal Client Library (TypeScript)

*   **Toiminto:** Selaimessa toimiva MCP-asiakasohjelma.
*   **Vaatimukset:**
    *   Yhdistää SSE/WebSocketin kautta yhdyskäytävään.
    *   Renderöi työkalukutsut ja vastaukset asianmukaisesti.
    *   Istunnonhallinta jaettavilla URL-osoitteilla.
    *   Minimalistinen, responsiivinen käyttöliittymäsuunnittelu.
*   **Teknologia:** TypeScript, Next.js 14, Tailwind CSS.

### 2.5. Session Management System (Flask)

*   **Toiminto:** Jaettujen istuntojen tallennus ja haku.
*   **Vaatimukset:**
    *   Muuttumaton istuntotallennus.
    *   Jaettavan URL-osoitteen generointi.
    *   Vain luku -toistotoiminto.
    *   Upotettavat istunto-widgetit.
*   **Teknologia:** Redis väliaikaisille tiedoille, S3-yhteensopiva tallennustila artefakteille.

### 2.6. Frontend (React)

*   **Toiminto:** Käyttöliittymä MCP UNIVERSE -alustalle.
*   **Vaatimukset:**
    *   Minimalistinen ja responsiivinen käyttöliittymä.
    *   Chat-tyylinen käyttöliittymä vuorovaikutukseen.
    *   Jaettavien URL-osoitteiden generointi.
    *   Istuntogalleria, joka esittelee viraalisia istuntoja.
*   **Teknologia:** React, Next.js 14, Tailwind CSS, shadcn/ui, Lucide icons, Recharts, framer-motion.

## 3. Käyttöönotto Docker Composella

Koko MCP UNIVERSE -järjestelmän käyttöönotto Docker Composella:

1.  **Siirry projektin juurihakemistoon:**
    ```bash
    cd /home/ubuntu/mcp-universe
    ```

2.  **Rakenna ja käynnistä palvelut:**
    ```bash
    docker-compose up --build -d
    ```
    Tämä komento:
    -   Rakentaa Docker-kuvat `nexus-gateway`, `session-manager` ja `frontend` -palveluille.
    -   Käynnistää kaikki palvelut (PostgreSQL, Redis, Nexus Gateway, Session Manager, Frontend) irrotetussa tilassa.

3.  **Käytä Frontendia:**
    Kun kaikki palvelut ovat käynnissä, voit käyttää MCP UNIVERSE -frontendia verkkoselaimessasi osoitteessa `http://localhost:80`.

## 4. Lisätietoja

Jokaisella komponentilla on oma `README.md` ja kehitysohjeet omassa hakemistossaan. Katso niistä tarkemmat kehitysohjeet.

## 5. Lisenssi

©ojkotka - Kaikki oikeudet pidätetään.

