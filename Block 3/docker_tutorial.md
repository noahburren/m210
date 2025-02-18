
# Docker-Container für HTML-Webseite

In diesem Tutorial lernst du, wie du deine HTML-Webseite in einem Docker-Container mit Nginx hosten kannst. Wir verwenden das Nginx-Image von Docker Hub, um die Webseite bereitzustellen.

## 1. Docker für Windows installieren
- Lade Docker Desktop für Windows herunter und installiere es: [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop).
- Folge den Installationsanweisungen. Stelle sicher, dass Hyper-V aktiviert ist und starte den Rechner neu.
- Nach der Installation öffne Docker Desktop.

## 2. Erstelle das Projektverzeichnis
- Erstelle ein neues Verzeichnis für dein Projekt:
  ```bash
  C:\my-html-project
  ```

- Lege deine `index.html`-Datei in diesem Verzeichnis ab.

## 3. Dockerfile erstellen
Erstelle im Projektordner eine neue Datei namens `Dockerfile` (ohne Dateiendung). Der Inhalt dieser Datei sollte folgendermaßen aussehen:

```dockerfile
# Verwende das Nginx-Image als Basis
FROM nginx:latest

# Kopiere die HTML-Datei in den Container
COPY index.html /usr/share/nginx/html/index.html

# Exponiere den Port 80
EXPOSE 80
```

## 4. Docker-Befehle ausführen
Öffne die **Eingabeaufforderung (cmd)** oder **PowerShell** und navigiere zu deinem Projektordner:

```bash
cd C:\my-html-project
```

### Docker-Image bauen
Verwende den folgenden Befehl, um das Docker-Image zu bauen:

```bash
docker build -t my-html-nginx .
```

### Container starten
Starte den Container mit folgendem Befehl:

```bash
docker run -d -p 8080:80 my-html-nginx
```

## 5. Webseite im Browser anzeigen
Öffne deinen Browser und gehe zu:

```
http://localhost:8080
```

Du solltest nun deine HTML-Seite sehen, die vom Nginx-Container bereitgestellt wird.

## 6. Verwalten des Containers
### Alle laufenden Container anzeigen
Verwende diesen Befehl, um alle laufenden Container zu sehen:

```bash
docker ps
```

### Container stoppen
Um einen Container zu stoppen, verwende:

```bash
docker stop <container-id>
```

Ersetze `<container-id>` mit der tatsächlichen ID des Containers, die du durch `docker ps` finden kannst.

## Optional: Direktes Mounten von Dateien
Falls du das `Dockerfile` nicht verwenden möchtest, kannst du auch das aktuelle Verzeichnis direkt in den Container mounten. Verwende diesen Befehl:

```bash
docker run -d -p 8080:80 -v C:\my-html-project:/usr/share/nginx/html nginx
```

Dadurch wird dein HTML-Verzeichnis direkt im Container verwendet und du musst das `Dockerfile` nicht mehr erstellen.

## Fazit
Du hast jetzt erfolgreich eine HTML-Webseite in einem Docker-Container mit Nginx bereitgestellt! Du kannst den Container jederzeit stoppen oder neu starten und deine Webseite weiterhin über `http://localhost:8080` aufrufen.
