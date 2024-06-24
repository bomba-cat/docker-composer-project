# Dokumentation `docker-compose`

<hr>

## Inhaltsverzeichnis
- Informieren
- Planen
- Entscheiden
- Reaslisieren
- Kontrollieren
- Auswerten
<hr>

## Informieren

### Die Images
- `gitlab/gitlab-ce:latest`
- `postgres:latest`
- `redis:latest`
- `mysql:latest`
- `nextcloud:latest`
- `mediawiki:latest`
- `portainer:latest`

### Container Relationen
Relationen | Braucht
---------- | -------
gitlab | gitlab_db, gitlab_redis
mediawiki | mediawiki_db
nextcloud | nextcloud_db
portainer | -

### Environment Variables

#### Allgemein
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
MYSQL_ROOT_PASSWORD | `/run/secrets/password` | Mysql root passwort
MYSQL_PASSWORD | `/run/secrets/password` | Mysql user passwort
POSTGRESS_PASSWORD | `/run/secrets/password` | Postgres passwort

#### Git, Postgres, Redis
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
GITLAB_OMNIBUS_CONFIG | external_url 'http://gitlab.docker.com', gitlab_rails['lfs_enabled'] = true, gitlab_rails['gitlab_shell_ssh_port'] = 22 | Gitlab Server and Rails info
POSTGRES_USER | gitlab | Postgres username

#### Mediawiki, Mysql
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
MYSQL_ | MEDIAWIKI_DB_ | mediawiki hat die env variablen von MYSQL auf MEDIAWIKI gewechselt
MYSQL_USER | mediawiki | Benutzername
MYSQL_DATABASE | mediawiki | Datenbank name

#### Nextcloud, Mysql
VARIABLE | VALUE | DESCRIPTION
-------- | ----- | -----------
MYSQL_DATABASE | nextcloud | Datenbank name
MYSQL_USER | nextcloud | Benutzername
MYSQL_HOST | nextcloud_db | Datenbank host
<hr>

## Planen

### Bilder

<a><img src="img/Networks.png" alt="Error Loading image" height="400"/></a>
<img src="img/System.png" alt="Error Loading image" height="400">

# Arbeitsplanung und Aufgabenteilung
<img src="https://github.com/mykhaylo-zhovkevych/docker-composer-project/assets/148889468/63d281f2-4ace-41bf-8668-babc5c86171e" height="400" width="auto">


### Arbeitsplanung
In dem Systemdiagramm können wir sehen, dass wir die Anforderungen analysiert und alles auf vier Container aufgeteilt haben. Am Ende werden wir all diese Infrastruktur zusammenbauen, sodass wir sie auf einer Arbeitsmaschine testen können, was die endgültige Testung und Umsetzung des Ganzen vereinfacht.

### Aufgabenteilung
MediaWiki wurde von Mykhaylo realisiert und getestet, NextCloud von Jan und GitLab von Bledion. Portainer haben wir entschieden, am Ende gemeinsam zu machen, aber Mykhaylo hat es umgesetzt und die zugehörigen Datenbanken wird jeder für seinen Container selbst erstellen.
Das Testkonzept, das die Testprotokollierung und den Testplan umfasst, wurde von Jan ausgefühlt. Die Dokumentation wurde hauptsächlich von Bledion geführt und zusammengefasst, zusätzlich haben Jan und Mykhaylo die Umgebungsvariablen und Images zugeordnet. Die Journale hat jeder für sich selbst geführt und das Sicherheitskonzept wurde von Mykhaylo erstellt.

<hr>

## Entscheiden

### Sicherheitskonzept 

#### Einleitung
- **Zweck und Umfang**: Der Zweck dieses Sicherheitskonzepts ist es, die Bedrohungen in den Diensten des Informatik-KMU zu minimieren.
- **Hintergrund**: Informatik-KMU will eine Infrastruktur mit MediaWiki, Nextcloud und Gitlab aufbauen, die mit Portainer verwaltet werden kann und eine persistente Datenspeicherung gewährleistet.

### Risikobewertung und Analyse

#### Bedrohungsanalyse
| Bedrohung            | Beschreibung |
|----------------------|--------------|
| Unbefugter Zugriff   | Unbefugte Personen könnten versuchen, auf MediaWiki, Nextcloud oder Gitlab zuzugreifen. |
| Datenverlust         | Daten könnten durch Hardware-Ausfälle, Software-Fehler oder menschliches Versagen verloren gehen. |
| Malware und Viren    | Schadsoftware könnte in die Systeme eindringen und Daten korrumpieren oder stehlen. |
| Schwache Authentifizierung | Schwache Passwörter könnten es Angreifern ermöglichen, Zugang zu den Systemen zu erlangen. |

#### Risikobewertung
| Risiko              | Wahrscheinlichkeit | Potenzieller Schaden |
|---------------------|--------------------|----------------------|
| Unbefugter Zugriff  | Mittel             | Hoch                 |
| Datenverlust        | Niedrig            | Sehr Hoch            |
| Malware und Viren   | Mittel             | Hoch                 |
| Schwache Authentifizierung | Mittel      | Hoch                 |

### Sicherheitsrichtlinien und -verfahren

#### Richtlinien
Die folgenden Sicherheitsrichtlinien sollen die Infrastruktur des Informatik-KMU schützen:

1. **Zugriffskontrollen**: Implementierung strenger Zugriffskontrollen für alle Dienste.
2. **Datensicherung**: Regelmässige Backups aller wichtigen Daten und Konfigurationen.
3. **Malwareschutz**: Installation und regelmässige Aktualisierung von Antiviren- und Antimalware-Software.
4. **Sicherheitsupdates**: Regelmässige Updates und Patches für alle Systeme und Anwendungen.

#### Verfahren
Die Verfahren zur Umsetzung der Sicherheitsrichtlinien umfassen:

1. **Einrichtung von Zugriffskontrollen**:
    - Verwendung starker Passwörter und Zwei-Faktor-Authentifizierung.
2. **Datensicherung**:
    - Einrichtung eines automatisierten Backup-Systems mit Cronjob für Linux.
    - Regelmässige Überprüfung der Backups auf Vollständigkeit und Integrität.
3. **Malwareschutz**:
    - Installation von Antiviren-Software auf WM.
    - Regelmässige Durchführung von Malware-Scans und Überprüfung der Systeme.
4. **Sicherheitsupdates**:
    - Regelmässige Überprüfung auf verfügbare Updates und Patches.
    - Testen und Einspielen von Updates in einer kontrollierten Umgebung, bevor sie auf die Produktionssysteme angewendet werden.

Durch die Umsetzung dieser Sicherheitsrichtlinien und -verfahren kann das Informatik-KMU eine robuste und sichere Infrastruktur für MediaWiki, Nextcloud und Gitlab gewährleisten, die mit Portainer überwacht und verwaltet wird.

#### 1. Testumfeld und Randbedingungen
Hardware | Netzwerkeinstellungen | Abhändigkeiten von anderen Systemen
-------- | --------------------- | -----------------------------------
Dieses Projekt erfordert eine Infrastruktur mit einem Server, in dem die mehreren VMs und Container nach Bedarf erstellt werden können. | Wir haben es so eingeebnet, dass es drei Netzwerke sein werden, der Grund dafür ist die Sicherheit, denn es gibt ein Brückennetzwerk, das MediaWiki Nextcloud und Gitlab umfasst, das die innere Kommunikation und zwischen Containern ermöglicht, aber die Datenbanken für MediaWiki und Nextcloud sind voneinander getrennt und können nur mit bestimmten Containern kommunizieren.| 

### 2. Testplan
Test-ID | Container-, Volume-, Netzwerkname | Was wird getestet
-------- | ----- | -----------
1 | gitlab_config (Gitlab) | Persistenz testen (Volumes)
2 | gitlab_log (Gitlab) | Persistenz testen (Volumes)
3 | gitlab_data (Gitlab) | Persistenz testen (Volumes)
4 | gitlab_db (Gitlab) | Persistenz testen (Volumes)
5 | gitlab_redis (Gitlab) | Persistenz testen (Volumes)
6 | nextcloud (Nextcloud) | Persistenz testen (Volumes)
7 | nextcloud_db (Nextcloud) | Persistenz testen (Volumes)
8 | mediawiki (Mediawiki) | Persistenz testen (Volumes)
9 | mediawiki_db (Mediawiki) | Persistenz testen (Volumes)
10 | portainer_data (Portainer) | Persistenz testen (Volumes)
11 | main | Netzwerke testen
12 | gitlab | Netzwerke testen
13 | nextcloud | Netzwerke testen
14 | mediawiki | Netzwerke testen
15 | Gitlab | App testen
16 | Nextcloud | App testen
17 | Mediawiki | App testen
18 | Portainer | App testen
19 | Gitlab | Benutzer testen (Login)
20 | Nextcloud | Benutzer testen (Login)
21 | Mediawiki | Benutzer testen (Login)
22 | Portainer | Benutzer testen (Login)
23 | Gitlab, Nextcloud, Mediawiki, Portainer | Sicherheit testen (Passwörter)
24 | Gitlab | Ressourcen testen
25 | Nextcloud | Ressourcen testen
26 | Mediawiki | Ressourcen testen
27 | Portainer | Ressourcen testen

### 3. Testmittel und -methoden
Test-ID | Testmittel | Testmethoden
-------- | ----- | -----------
1 | ----- | -----------
2 | ----- | -----------
3 | ----- | -----------
4 | ----- | -----------
5 | ----- | -----------
6 | ----- | -----------
7 | ----- | -----------
8 | ----- | -----------
9 | ----- | -----------
10 | ----- | -----------
11 | ----- | -----------
12 | ----- | -----------
13 | ----- | -----------
14 | ----- | -----------
15 | ----- | -----------
16 | ----- | -----------
17 | ----- | -----------
18 | ----- | -----------
19 | ----- | -----------
20 | ----- | -----------
21 | ----- | -----------
22 | ----- | -----------
23 | ----- | -----------
24 | ----- | -----------
25 | ----- | -----------
26 | ----- | -----------
27 | ----- | -----------

### 4. Erwartete Resultate
Test-ID | Eingabe | Erwartete Resultate
-------- | ----- | -----------
1 | ----- | Daten wurden Persistent gespeichert
2 | ----- | Daten wurden Persistent gespeichert
3 | ----- | Daten wurden Persistent gespeichert
4 | ----- | Daten wurden Persistent gespeichert
5 | ----- | Daten wurden Persistent gespeichert
6 | ----- | Daten wurden Persistent gespeichert
7 | ----- | Daten wurden Persistent gespeichert
8 | ----- | Daten wurden Persistent gespeichert
9 | ----- | Daten wurden Persistent gespeichert
10 | ----- | Daten wurden Persistent gespeichert
11 | ----- | Nextcloud und Mediawiki können mit Gitlab kommunizieren
12 | ----- | Es kann nicht mit anderen Netzwerken kommuniziert werden
13 | ----- | Es kann nicht mit anderen Netzwerken kommuniziert werden
14 | ----- | Es kann nicht mit anderen Netzwerken kommuniziert werden
15 | ----- | App funktioniert und läuft auf dem richtigen Port
16 | ----- | App funktioniert und läuft auf dem richtigen Port
17 | ----- | App funktioniert und läuft auf dem richtigen Port
18 | ----- | App funktioniert und läuft auf dem richtigen Port
19 | ----- | Erfolgreicher login mit vorgegebenem Benutzernamen und Passwort
20 | ----- | Erfolgreicher login mit vorgegebenem Benutzernamen und Passwort
21 | ----- | Erfolgreicher login mit vorgegebenem Benutzernamen und Passwort
22 | ----- | Erfolgreicher login mit vorgegebenem Benutzernamen und Passwort
23 | ----- | Passwörter werden von einer externen Datei mitgegeben
24 | ----- | Ressourcen wurden korrekt begrenzt und eingeteilt
25 | ----- | Ressourcen wurden korrekt begrenzt und eingeteilt
26 | ----- | Ressourcen wurden korrekt begrenzt und eingeteilt
27 | ----- | Ressourcen wurden korrekt begrenzt und eingeteilt
<hr>

## Realisieren

### 1. Durchführung und Protokollierung
Test-ID | Ausgeführt von | Datum | Protokollierung | Resultate
-------- | ----- | ----- | ----------- | -----------
1 | ----- | 24.06.2024 | ----------- | -----------
2 | ----- | 24.06.2024 | ----------- | -----------
3 | ----- | 24.06.2024 | ----------- | -----------
4 | ----- | 24.06.2024 | ----------- | -----------
5 | ----- | 24.06.2024 | ----------- | -----------
6 | ----- | 24.06.2024 | ----------- | -----------
7 | ----- | 24.06.2024 | ----------- | -----------
8 | ----- | 24.06.2024 | ----------- | -----------
9 | ----- | 24.06.2024 | ----------- | -----------
10 | ----- | 24.06.2024 | ----------- | -----------
11 | ----- | 24.06.2024 | ----------- | -----------
12 | ----- | 24.06.2024 | ----------- | -----------
13 | ----- | 24.06.2024 | ----------- | -----------
14 | ----- | 24.06.2024 | ----------- | -----------
15 | ----- | 24.06.2024 | ----------- | -----------
16 | ----- | 24.06.2024 | ----------- | -----------
17 | ----- | 24.06.2024 | ----------- | -----------
18 | ----- | 24.06.2024 | ----------- | -----------
19 | ----- | 24.06.2024 | ----------- | -----------
20 | ----- | 24.06.2024 | ----------- | -----------
21 | ----- | 24.06.2024 | ----------- | -----------
22 | ----- | 24.06.2024 | ----------- | -----------
23 | ----- | 24.06.2024 | ----------- | -----------
24 | ----- | 24.06.2024 | ----------- | -----------
25 | ----- | 24.06.2024 | ----------- | -----------
26 | ----- | 24.06.2024 | ----------- | -----------
27 | ----- | 24.06.2024 | ----------- | -----------

### Docker compose dateien
Name | Datei
Abgabe | [docker-compose.yaml](src/docker-compose.yaml)
Bledion | [docker-compose.yaml](Bledion/docker-compose.yaml)
Jan | [docker-compose.yaml](Jan/docker-compose.yaml)
<hr>

## Kontrollieren

Wir haben unsere Arbeitszeiten und Pakete sehr gut einhalten können und es gab kaum eine abweichen von dem Arbeitsplan. Unser code hatte einige probleme am anfang, wobei wir diese zusammen lösen konnten. Dazu habe ich ein Skript gemacht welches die Containers, Volumes und Netzwerke mit `docker-compose` erstellt und alles aufgesetzt hat.

<hr>

## Auswerten

### Arbeits Journal
| Datum        | Jan                       | Mykhaylo                | Bledion |
| ----------- | ------------------------- | ----------------------- | ------- |
| 17.06.2024  | Einleitung ... <br><br><table><tr><td>Erwarteten Ziele: here some text not more than 40 chars </td></tr>  <td>Erreichte Ziele: here some text not more than 40 chars </td></table><br><b>Zusammenfassung:</b> Mein Ziel war es den Code für die Installation von Nextcloud zu schreiben. Ich habe den Code schon fast fertig. Ich muss noch den MySQL Server korrekt aufsetzen. Ich hatte Probleme beim Erstellen des Codes, da er nicht richtig ausgeführt wurde.<br><br><table><tr><td>Problemen: </td></tr></table>............................... | Am ersten Tag haben wir die Aufgaben unter allen aufgeteilt, und ich wollte die MediaWiki-Aufgabe übernehmen. Dafür musste ich Docker-Compose Datei erstellen, inkl. der MySQL-Datenbank mit persistenter Datenspeicherung. Am Ende des Tages habe ich dann den Container gestartet und die erste Seite mit MediaWiki erstellt. <br><br><table><tr><td>Erwarteten Ziele: eine funktionale MediaWiki</td></tr>  <td>Erreichte Ziele: MediaWiki mit persistent MySQL </td></table><br><b>Zusammenfassung:</b> Ich habe meine Ziele erreicht und eine Docker Compose Datei erstellt, die zwei Images umfasst: MySQL und MediaWiki. Zwar habe ich die Konfiguration noch nicht abschliessend überprüft, aber nach der ersten Ausführung in meiner Linux-Umgebung funktioniert sie einwandfrei.<br><br><table><tr><td>Problemen: </td></tr></table> Ich habe an jenem Tag keine Probleme gehabt. | Einleitung ... <br><br><table><tr><td>Erwarteten Ziele: here some text not more than 40 chars </td></tr>  <td>Erreichte Ziele: here some text not more than 40 chars </td></table><br><b>Zusammenfassung:</b> Ich habe mich mit dem Gitlab auseinander gesetzt und weiss jetzt alles was ich dazu brauche. Ich habe auch einen Run script erstellt um die dockers zu ausführen und schemas gezeichnet.<br><br><table><tr><td>Problemen: </td></tr></table>............................... |
| 20.06.2024  | Einleitung ... <br><br><table><tr><td>Erwarteten Ziele: here some text not more than 40 chars </td></tr>  <td>Erreichte Ziele: here some text not more than 40 chars </td></table><br><b>Zusammenfassung:</b> Mein Ziel war es, den Code von Nextcloud zu vervollständigen. Ich hatte heute keine Probleme mit meinem Teil. Wir müssen nun nur noch das Testkonzept fertig erstellen, sowie kleine Anpassungen an unserem Code vornehmen, damit dieser einwandfrei funktioniert und allen Anforderungen entspricht. <br><br><table><tr><td>Problemen: </td></tr></table>............................... | Beim Selbststudium haben wir entschieden, dass wir weiter an der Projektarbeit arbeiten werden. Ich habe meine Docker-Compose Datei mit Ressourcengrenzen erweitert und eine neue Docker-Compose Datei für Portainer erstellt. Am Ende des Tages habe ich noch kurz die Vorlagen für das Testkonzept erstellt. <br><br><table><tr><td>Erwarteten Ziele: vollständige MediaWiki und Portainer Docker-Compose Dateien</td></tr>  <td>Erreichte Ziele: verbessert MediaWiki und Portainer </td></table><br><b>Zusammenfassung:</b> Heute habe ich meinen Code verbessert, indem ich eine Ressourcenbeschränkung eingeführt und einen neuen Container für Portainer erstellt habe, den ich allerdings noch nicht getestet habe. Solange das Docker Compose korrekt aussieht, sollte das in Ordnung sein. Zusätzlich habe ich die Vorlagen für das Testkonzept erstellt und den ersten Absatz ausgefüllt. Zudem habe ich einige kleine Commits mit Umbenennungen der Ordnerstruktur gemacht.<br><br><table><tr><td>Problemen: </td></tr></table> Ich habe an jenem Tag keine Probleme gehabt. | Einleitung ... <br><br><table><tr><td>Erwarteten Ziele: here some text not more than 40 chars </td></tr>  <td>Erreichte Ziele: here some text not more than 40 chars </td></table><br><b>Zusammenfassung:</b><br><br><table><tr><td>Problemen: </td></tr></table>............................... |
| 24.06.2024  | Einleitung ... <br><br><table><tr><td>Erwarteten Ziele: here some text not more than 40 chars </td></tr>  <td>Erreichte Ziele: here some text not more than 40 chars </td></table><br><b>Zusammenfassung:</b> Mein Ziel war es den Testplan weiter auszuarbeiten, sowie diesen fertig zu stellen. Ich hatte ein wenig Probleme beim Erstellen des Testplans, jedoch habe ich dies nach einer Absprache mit meinem Team verstanden und konnte diesen umsetzen. <br><br><table><tr><td>Problemen: </td></tr></table>............................... | In der letzten Lektion mussten wir alles zusammenstellen. Deshalb habe ich einen Arbeitsplan visualisiert, ein Sicherheitskonzept erstellt und einige Sätze in der Dokumentation bearbeitet. <br><br><table><tr><td>Erwarteten Ziele: Arbeitsplan, Sicherheitskonzept, Journal </td></tr>  <td>Erreichte Ziele:  Arbeitsplan, Sicherheitskonzept, Journal </td></table><br><b>Zusammenfassung: </b>Am letzten Tag habe ich an unserer Dokumentation gearbeitet, nämlich am Arbeitsplan, Journal und Sicherheitskonzept, und keine Änderungen vorgenommen..<br><br><table><tr><td>Problemen: </td></tr></table>Keine besonderen Probleme. | Einleitung ... <br><br><table><tr><td>Erwarteten Ziele: here some text not more than 40 chars </td></tr>  <td>Erreichte Ziele: here some text not more than 40 chars </td></table><br><b>Zusammenfassung:</b><br><br><table><tr><td>Problemen: </td></tr></table>............................... |
